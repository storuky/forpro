class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title
  
  def title
    I18n.t('product.'+object.title)
  end
end