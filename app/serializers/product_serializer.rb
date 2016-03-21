class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :category
  
  def title
    I18n.t("product.#{object.title}")
  end

  def category
    category = object.category.try(:title)
    if category
      I18n.t("category.#{category}")
    end
  end
end