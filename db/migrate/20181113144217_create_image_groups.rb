class CreateImageGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :image_groups do |t|
      t.string :name

      t.timestamps
    end
  end
end
