class CreateImageRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :image_requests do |t|
      t.references :image, foreign_key: { on_delete: :cascade }, index: true

      t.timestamps
    end
  end
end
