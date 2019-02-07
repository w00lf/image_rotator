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
    images = image.attachment_images.each.with_object({}).with_index(1) do |(attachment, result), i|
      index = i == 1 ? '' : i.to_s
      result["image#{index}"] = URI.join(request.url, attachment.file.url)
    end
    names = image.image_infos.each.with_object({}).with_index(1) do |(info, result), i|
      if i == 1
        result["name"] = info.name
        result["text"] = info.name
        next
      end
      result["text#{i}"] = info.name
    end
    result.merge(images).merge(names).to_json
  end
end
