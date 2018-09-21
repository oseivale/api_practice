class PlaysController < ApplicationController
skip_before_action :verify_authenticity_token
  def index
    @play = Play.new
    @image = unsplash_response
    @plays = Play.all


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
    @play.image_name = params[:play][:image_name]
    @play.image_url = params[:play][:image_url]

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

      @play.image_url = params[:image_url]
      @play.save

    end

  def unsplash_response
    response = HTTParty.get("https://api.unsplash.com/photos/?client_id=[ABC]")

    response_json = JSON.parse(response.body)




  end

  def edit
  end


end
