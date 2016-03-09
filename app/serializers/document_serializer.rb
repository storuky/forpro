class DocumentSerializer < ActiveModel::Serializer
  attributes :id, :body, :filename, :extension, :size

  def body
    object.body.as_json[:body]
  end

  def extension
    object.body.file.extension.downcase
  end

  def size
    size = object.body.file.size
    if size > 1000000
      "#{(object.body.file.size / 1024.0 / 1024.0).round} Mb"
    else
      "#{(object.body.file.size / 1024.0).round} Kb"
    end
  end
end
