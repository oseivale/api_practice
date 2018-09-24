class Play < ApplicationRecord
  belongs_to :entry

  def unsplash_response
        response = HTTParty.get("https://api.unsplash.com/search?page=1&query=#{word}&client_id=[ABC]")

        response_json = JSON.parse(response.body)
  end





end
