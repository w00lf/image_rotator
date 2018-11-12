class Api::V1::ImagesController < ApplicationController
  def random
    weights = rand(Image.sum(:position))
    Image.all.each do |image|
      if (weights -= image.position) <= 0
        render json: {
          name: image.name,
          position: image.position,
          url: image.file.url
        }.to_json
        break
      end
    end
  end
end
