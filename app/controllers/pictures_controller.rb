class PicturesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
#TODO remove :new
  def index
    @pictures = Picture.all
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

end
