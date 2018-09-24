class EntriesController < ApplicationController

  def index
    @entry = Entry.new
    @entries = Entry.all
  end

  def new
    @entry= Entry.new
  end

  def create
    @entry = Entry.new
    @entry.title = params[:entry][:title]
    @entry.content = params[:entry][:content]
    @entry.entry_id = params[:entry][:id]

    if @entry.save
      render :index
    end
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def edit

  end

  def update

  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    redirect_to root_url
  end
end
