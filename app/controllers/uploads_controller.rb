class UploadsController < ApplicationController
  def logo
    logo = Logo.new body: params[:attachments][0]
    if logo.save
      render json: dump([logo], serializer: ImageSerializer)
    else
      render json: {msg: logo.errors.full_messages.join(', ')}, status: 422
    end
  end

  def files
    images, documents = [], []

    params[:attachments].map do |attachment|
      if ["image/png", "image/jpg", "image/jpeg"].include?(attachment.content_type)
        image = Image.new(body: attachment)
        if image.save
          images << image
        else
          documents << Document.create(body: attachment)
        end
      else
        documents << Document.create(body: attachment)
      end
    end

    result = {
      images: serialize(images, serializer: ImageSerializer),
      documents: serialize(documents, serializer: DocumentSerializer)
    }

    render json: Oj.dump(result)
  end
end
