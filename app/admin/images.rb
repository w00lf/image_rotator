ActiveAdmin.register Image do
  permit_params :name, :position, :file

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
      f.input :file, as: :file
      actions
    end
  end
end
