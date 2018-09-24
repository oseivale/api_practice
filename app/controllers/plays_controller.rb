class PlaysController < ApplicationController
skip_before_action :verify_authenticity_token

  def index
    @fake_post = ["Blue", "Cars", "Mountain", "Sunshine"]
    @play = Play.new
    @plays = Play.all
    @images = unsplash_response


    respond_to do |format|
      format.html
      format.text
      format.json do
        render json: @plays.map {|play|
          {image_name: play.image_name, image_url: play.image_url
          }
        }
      end

    end
  end

  def new
    @play = Play.new
  end

  def create
    @play = Play.new
    @play.image_name = params[:plays][:image_name]
    @play.image_url = params[:plays][:image_url]

    if @play.save
      if request.xhr?
        respond_to do |format|
          format.html do
            render :show
          end
          format.json do
            render json: @play
          end
        end
      end
    end
  end

  def image_saved
    @play = Play.new


      @play.save
      render json: @play
    end

  def unsplash_response

    response = HTTParty.get("https://api.unsplash.com/photos/random?per_page=10&query=#{@fake_post.sample}&client_id=[ABC]&count=10")

    @response_json = JSON.parse(response.body)

  end

  def image(response)

  end

  def edit
  end


end
