class MigrateImageNamesToImageInfos < ActiveRecord::Migration[5.2]
  def up
    Image.find_each do |image|
      puts(image.id)
      image.image_infos.create!(name: image.name) rescue print("Skipped")
    end
  end

  def down
  end
end
