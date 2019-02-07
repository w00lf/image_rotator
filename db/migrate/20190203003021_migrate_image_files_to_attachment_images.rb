class MigrateImageFilesToAttachmentImages < ActiveRecord::Migration[5.2]
  def up
    Image.find_each do |image|
      puts(image.id)
      image.attachment_images.create!(file: image.file, name: image.name) rescue print("Skipped")
    end
  end

  def down
  end
end
