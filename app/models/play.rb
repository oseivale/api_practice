class Play < ApplicationRecord





  def unsplash_response
    response = HTTParty.get("https://api.unsplash.com/photos?client_id=#{ENV["SPLASH_KEY"]}")

    response_json = JSON.parse(response.body)




  end


end
