class Image < ApplicationRecord
  belongs_to :image_group

  has_attached_file :file
  validates_attachment_content_type :file, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  validates :name, :position, :file, :propability, presence: true
  validates :position, numericality: { only_integer: true }
  validates :propability, numericality: { only_integer: true }
  validate :propability_summary

  def propability_summary
    return unless propability
    existing_sum = Image.where(image_group_id: image_group_id).all.reject {|n| n.id == self.id }.map(&:propability).sum.to_i
    return errors.add(:propability, 'Sum of propability cannot be more than 100') if (existing_sum + propability) > 100
    true
  end
end
