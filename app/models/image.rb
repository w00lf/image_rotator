class Image < ApplicationRecord
  has_attached_file :file
  validates_attachment_content_type :file, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  validates :name, :position, :file, presence: true
  validates :position, numericality: { only_integer: true }
  validate :position_summary

  def position_summary
    existing_sum = Image.all.reject {|n| n.id == self.id }.map(&:position).sum
    return errors.add(:position, 'Sum of positions cannot be more than 100') if (existing_sum + position) > 100
    true
  end
end
