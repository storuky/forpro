class Document < ActiveRecord::Base
  mount_uploader :body, DocumentUploader
  belongs_to :position

  validates :body, file_size: { less_than: 10.megabytes }
end
