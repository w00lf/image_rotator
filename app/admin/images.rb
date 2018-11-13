ActiveAdmin.register Image do
  permit_params :name, :position, :file, :image_group_id, :propability

  index do
    column(:id)
    column(:name)
    column(:image_group)
    column(:image) do |object|
      image_tag object.file.url, width: 100, height: 100
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :position
      row :file do |obj|
        img src: obj.file.url
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :position
      f.input :propability
      f.input :file, as: :file
      f.input :image_group
      actions
    end
  end
end
