ActiveAdmin.register ImageRequest do
  actions :index

  filter :image
  filter :image_group
  filter :created_at_gt, as: :date_time_picker
  filter :created_at_lt, as: :date_time_picker

  index do
    ImagesWithCountsQuery.call(id: search.result.select(:id)).each do |image|
      table_for image do
        column :name
        column :propability do |object|
          "#{object.propability} %"
        end
        column(:image) do |object|
          image_tag object.file.url, width: 100, height: 100
        end
        column(:count)
        actions
      end
    end
  end
end
