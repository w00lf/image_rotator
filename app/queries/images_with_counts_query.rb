class ImagesWithCountsQuery
  def self.call(filter_subquery)
    request_subquery = ImageRequest
                        .select('image_id, count(*)')
                        .group(:image_id)
                        .where(filter_subquery)
                        .to_sql
    Image
      .select('*')
      .joins("left join (#{request_subquery}) counts on images.id = counts.image_id")
      .where('count is not NULL')
  end
end