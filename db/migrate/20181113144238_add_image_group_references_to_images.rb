class AddImageGroupReferencesToImages < ActiveRecord::Migration[5.2]
  def change
    add_reference :images, :image_group, foreign_key: { on_delete: :cascade }, index: true
  end
end
