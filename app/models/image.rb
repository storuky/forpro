class Image < ActiveRecord::Base
  mount_uploader :body, ImageUploader
  belongs_to :position

  validates :body, file_size: { less_than: 5.megabytes },
                   file_content_type: { allow: ['image/jpg', 'image/jpeg', 'image/png'] }
end
