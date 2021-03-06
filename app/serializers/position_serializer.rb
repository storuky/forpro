class PositionSerializer < ActiveModel::Serializer
  require "base64"

  attributes *(Position.attribute_names - []), :product, :weight_dimension, :currency, :price_weight_dimension, :trade_type_title, :min_weight_dimension

  has_one :logo, serializer: ImageSerializer
  has_many :images
  has_many :documents

  def product
    ProductSerializer.new(object.product).as_json || {}
  end

  def email
    Base64.encode64(Base64.encode64(object.email)) rescue nil
  end

  def weight_dimension
    WeightDimensionSerializer.new(object.weight_dimension).as_json || {}
  end

  def min_weight_dimension
    WeightDimensionSerializer.new(object.weight_dimension).as_json || {}
  end

  def price_weight_dimension
    WeightDimensionSerializer.new(object.price_weight_dimension).as_json || {}
  end

  def currency
    CurrencySerializer.new(object.currency).as_json || {}
  end

  def trade_type_title
    I18n.t("trade_type.#{object.trade_type}")
  end

  def lat
    object.lat
  end

  def lng
    object.lng
  end
end
