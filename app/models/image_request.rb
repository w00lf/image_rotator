class ImageRequest < ApplicationRecord
  has_one :image_group, through: :image
  belongs_to :image, counter_cache: :views_count
  delegate :file, to: :image
end
