class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :category
  
  def title
    I18n.t("product.#{object.title}")
  end

  def category
    I18n.t("category.#{object.category.title}")
  end
end