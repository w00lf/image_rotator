class CreateImageInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :image_infos do |t|
      t.string :name
      t.belongs_to :image, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
