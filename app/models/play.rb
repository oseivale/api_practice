class Play < ApplicationRecord
  belongs_to :entry

  def unsplash_response
        response = HTTParty.get("https://api.unsplash.com/search?page=1&query=#{word}&client_id=e94ba2672cfb2865cd80ff61f24b85c7354cd8d40f78b6969478d81e0ccde323")

        response_json = JSON.parse(response.body)
  end





end
