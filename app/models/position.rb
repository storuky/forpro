class Position < ActiveRecord::Base
  include Companiable
  include FixSphinx

  def self.dimensions_ids
    WeightDimension.pluck(:id) rescue []
  end

  def self.products_ids
    Product.pluck(:id) rescue []
  end

  def self.currencies_ids
    Currency.pluck(:id) rescue []
  end

  def self.colors
    %w(
        agrofor-1 agrofor-2 agrofor-3 agrofor-4 agrofor-5
        fuelfor-1 fuelfor-2 fuelfor-3
        woodfor-1 woodfor-2 woodfor-3
    )
  end

  has_many :images
  has_many :documents
  belongs_to :logo, class_name: Logo

  belongs_to :product
  belongs_to :category
  belongs_to :company
  belongs_to :currency
  belongs_to :price_weight_dimension, class_name: WeightDimension
  belongs_to :min_weight_dimension, class_name: WeightDimension
  belongs_to :weight_dimension

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  
  validates_presence_of :phone, :name, :title
  validates :weight, numericality: { greater_than: 0 }, allow_blank: false
  validates :min_weight, numericality: { greater_than_or_equal_to: 0 }
  validates :price, numericality: { greater_than: 0 }, allow_blank: false
  validates :deviation, :inclusion => 0.0..50.0
  validates_presence_of :address, :lat, :lng

  
  validates :website, :url => {:allow_blank => true}
  validate :less_then_weight

  validates :color, inclusion: { in: Position.colors }
  validates :trade_type, inclusion: { in: ["buy", "sell"] }
  validates :product_id, inclusion: { in: Position.products_ids }
  validates :weight_dimension_id, inclusion: { in: Position.dimensions_ids }
  validates :price_weight_dimension_id, inclusion: { in: Position.dimensions_ids }
  validates :currency_id, inclusion: { in: Position.currencies_ids }

  before_save :set_category_id
  before_save :set_etalon
  before_save :set_index_field

  def self.pluck_fields
    self.pluck(:id, :product_id, :trade_type, :weight, :weight_dimension_id, :price, :price_weight_dimension_id, :currency_id, :min_weight, :min_weight_dimension_id, :color, :lat, :lng)
  end

  def self.look_for query
    if query.present?
      ids = Position.search_for_ids(query)
      Position.where(id: ids)
    else
      self
    end
  end

  def filter filters = []
    currencies = Currency.all_from_cache
    sql = []

    filters.first(10).each do |filter|
      unless filter["checked_positions_ids"].try(:any?)
        user_currency = Currency.all_by_index_from_cache(serializer: CurrencySerializer)[filter[:currency_id].to_i]
        wd_cache = WeightDimension.all_by_index_from_cache(serializer: WeightDimensionSerializer)

        trade_type_id = filter["trade_type_id"] if filter["trade_type_id"]
        if trade_type_id
          trade_type_query = "AND \"position_bases\".\"trade_type_id\" = #{trade_type_id}"
        end

        product_id = filter["product_id"] if filter["product_id"]
        weight_from = (filter["weight_from"] || 0).to_f * wd_cache[filter["weight_from_dimension_id"].to_i][:convert] rescue 0
        weight_to = (filter["weight_to"] || 9999999999.0).to_f * wd_cache[filter["weight_to_dimension_id"].to_i][:convert] rescue 9999999999.0

        price_sql = "1=1"
        if filter["price_from"] or filter["price_to"]
          price_from = (filter["price_from"] || 0).to_f / wd_cache[filter["price_from_weight_dimension_id"].to_i][:convert] rescue 0
          price_to = (filter["price_to"] || 9999999999.0).to_f / wd_cache[filter["price_to_weight_dimension_id"].to_i][:convert] rescue 9999999999.0

          price_sql = []
          currencies.each do |currency|
            converted_price_from = price_from / currency.get_rate(user_currency[:name])
            converted_price_to = price_to / currency.get_rate(user_currency[:name])
            price_sql << "(\"position_bases\".\"currency_id\" = #{currency.id} AND (\"position_bases\".\"price_etalon\" BETWEEN #{converted_price_from} AND #{converted_price_to}))"
          end
          price_sql = price_sql.join(" OR ")
        end

        in_radius_sql = "1=1"
        if filter["coords"]
          lat = filter["coords"][0]
          lng = filter["coords"][1]
          
          radius_of_earth = 6378137
          
          radius = filter["radius"].present? ? filter["default_radius"].to_f + (filter["radius"].to_f * 1000) : filter["default_radius"].to_f

          a = "SIN((positions.lat-#{lat})*PI()/360)  *  SIN((positions.lat-#{lat})*PI()/360)  +  COS(#{lat}*PI()/180) * COS(positions.lat*PI()/180) * SIN((positions.lng-#{lng})*PI()/360) * SIN((positions.lng-#{lng})*PI()/360)"
          in_radius_sql = %{
            #{radius} >= 2 * ATAN2(SQRT(#{a}), SQRT(1-#{a})) * #{radius_of_earth}
          }
        end

        sql << "(\"position_bases\".\"status\" = 'opened') AND (#{in_radius_sql}) AND (#{price_sql}) AND (\"position_bases\".\"product_id\" = #{product_id} #{trade_type_query} AND (\"position_bases\".\"weight_etalon\" BETWEEN #{weight_from} AND #{weight_to}))"

      end

      if filter["checked_positions_ids"].try(:any?)
        suitable_positions = Position.find_suitable filter["checked_positions_ids"]
        sql << suitable_positions.to_sql.split("WHERE")[1]
      end
    end
    
    self.where sql.join(" OR ")
  end

  private
    def set_category_id
      self.category_id = product.category_id
    end

    def set_etalon
      self.price = price.round(2)
      self.weight_etalon = weight * WeightDimension.by_index[weight_dimension_id].convert
      self.min_weight_etalon = min_weight * WeightDimension.by_index[min_weight_dimension_id].convert
      self.price_etalon = price / WeightDimension.by_index[price_weight_dimension_id].convert
    end

    def less_then_weight
      errors.add(:min_weight) if WeightDimension.normalize(self.min_weight, self.min_weight_dimension_id) > WeightDimension.normalize(self.weight, self.weight_dimension_id)
    end

    def set_index_field
      temp = [title, description]
      [:en, :ru].each do |locale|
        temp << I18n.t("category.#{category.title}", :locale => locale)
        temp << I18n.t("product.#{product.title}", :locale => locale)
        I18n.t("position.trade_types_variation.#{trade_type}", :locale => locale).each do |t|
          temp << t
        end
      end
      self.index_field = temp.join(" ")
    end
end