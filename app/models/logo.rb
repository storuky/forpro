class Logo < ActiveRecord::Base
  mount_uploader :body, LogoUploader

  has_many :positions

  validates :body, file_size: { less_than: 5.megabytes },
                   file_content_type: { allow: ['image/jpg', 'image/jpeg', 'image/png'] } 
end
