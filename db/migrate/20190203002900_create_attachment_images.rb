class CreateAttachmentImages < ActiveRecord::Migration[5.2]
  def change
    create_table :attachment_images do |t|
      t.attachment :file
      t.belongs_to :image, foreign_key: { on_delete: :cascade }
      t.text :name

      t.timestamps
    end
  end
end
