class PlaysController < ApplicationController
skip_before_action :verify_authenticity_token

  def index
    @fake_post = "was a sunshine day!"
    @play = Play.new
    @images = unsplash_response
    puts @images
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
      render json: @play
    end

  def unsplash_response
    longest_word = @fake_post.split.max_by{|word| word.length}
    puts"////////////////////////#{ENV["SPLASH_KEY"]}"
    response = HTTParty.get("https://api.unsplash.com/search/photos?page=1&query=#{longest_word}&client_id=#{ENV["SPLASH_KEY"]}")

    response_json = JSON.parse(response.body)





  end

  def edit
  end


end
