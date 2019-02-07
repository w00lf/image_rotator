class AttachmentImage < ApplicationRecord
  belongs_to :image

  has_attached_file :file

  validates_attachment_content_type :file, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates :name, :file, presence: true
end
