ActiveAdmin.register ImageRequest do
  actions :index

  filter :image
  filter :image_group
  filter :created_at_gt, as: :date_time_picker
  filter :created_at_lt, as: :date_time_picker

  index do
    panel "Total count: #{collection.total_count}"
    column(:image)
    column(:image) do |object|
      image_tag object.file.url, width: 100, height: 100
    end
    column(:created_at)
  end
end
