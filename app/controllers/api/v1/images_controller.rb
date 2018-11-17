class Api::V1::ImagesController < ApplicationController
  def random
    image_group = ImageGroup.find(params[:image_group_id])
    weights = rand(0..image_group.images.sum(:propability))
    image_group.images.all.each do |image|
      weights -= image.propability
      if weights <= 0
        image.image_requests.create
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
