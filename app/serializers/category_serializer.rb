class CategorySerializer < ActiveModel::Serializer
  attributes :id, :title

  has_many :products

  def title
    I18n.t('category.'+object.title)
  end
end
