class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :calendar]

  def home
    @picture = Picture.last
  end
end
