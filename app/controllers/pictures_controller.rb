class PicturesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @pictures = Picture.all
  end
end
