class Api::V1::ImagesController < ApplicationController
  def random
    image_group = ImageGroup.find(params[:image_group_id])
    weights = rand(image_group.images.sum(:position))
    Image.all.each do |image|
      if (weights -= image.position) <= 0
        render json: {
          name: image.name,
          position: image.position,
          image: URI.join(request.url, image.file.url)
        }.to_json
        break
      end
    end
  end
end
