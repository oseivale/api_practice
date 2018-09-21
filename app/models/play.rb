class Play < ApplicationRecord





  def unsplash_response
    response = HTTParty.get("https://api.unsplash.com/photos/?client_id=[ABC]")

    response_json = JSON.parse(response.body)

    url = response_json[0]['urls']['full']


  end


end
