ActiveAdmin.register Image do
  permit_params :position,
    :image_group_id,
    :propability,
    :offer_id,
    attachment_images_attributes: [:name, :file]

  filter :name
  filter :image_group
  filter :created_at

  index do
    column(:id)
    column(:image_group)
    column(:views_count)
    column(:propability) { |object| "#{object.propability} %" }
    column(:position)
    column(:images, class: 'flex') do |object|
      object.attachment_images.each.with_index(1) do |attachment, i|
        div do
          h3 "Image ##{i}"
          para do
            image_tag attachment.file.url, width: 100, height: 100
          end
          para do
            "name: #{attachment.name}"
          end
        end
      end
      para
    end
    actions
  end

  show do
    attributes_table do
      row :position
      resource.attachment_images.each.with_index(1) do |attachment, i|
        h3 "Image ##{i}"
        para do
          image_tag attachment.file.url, width: 100, height: 100
        end
        para do
          attachment.name
        end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :position
      f.input :propability
      f.has_many :attachment_images do |j|
        j.input :file, as: :file
        j.input :name, as: :string
      end
      f.input :image_group
      f.input :offer_id
      actions
    end
  end
end
