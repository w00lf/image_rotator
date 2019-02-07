class ImageInfo < ApplicationRecord
  belongs_to :image

  validates :name, presence: true
end
