class Api::V1::ImagesController < ApplicationController
  def random
    image_group = ImageGroup.find(params[:image_group_id])
    weights = rand(0..image_group.images.sum(:propability))
    image_group.images.all.each do |image|
      weights -= image.propability
      if weights <= 0
        image.image_requests.create
        render json: image_json(image)
        break
      end
    end
  end

  private

  def image_json(image)
    result = {
      position: image.position,
    }
    images = image.attachment_images.each.with_object({}).with_index do |(attachment, result), i|
      index = i.zero? ? '' : i.to_s
      result["image#{index}"] = URI.join(request.url, attachment.file.url)
      result["name#{index}"] = attachment.name
    end
    result.merge(images).to_json
  end
end
