class AddViewsCountToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :views_count, :integer, default: 0, null: false
  end
end
