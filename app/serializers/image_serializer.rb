class ImageSerializer < ActiveModel::Serializer
  attributes :id, :body

  def body
    object.body.as_json[:body]
  end
end
