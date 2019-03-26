class PicturesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :find_picture, only: [:edit, :update]
#TODO remove :new
  def index
    @pictures = Picture.all
                        .sort_by {|picture| picture.date}
                        .reverse
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to pictures_path
    else
      render :new
    end
  end

  def update
    @picture.update(picture_params)
    if @picture.save
      redirect_to pictures_path
    else
      render :edit
    end
  end

private
  def picture_params
    params.require(:picture).permit(
      :link,
      :title,
      :user_id,
      :date,
      :like,
      :photo)
  end

  def find_picture
    @picture = Picture.find(params[:id])
  end

end
