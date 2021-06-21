class PartnersController < ApplicationController
  skip_before_action :authenticate_user!, only:[:index]

  def index
    @partners = Partner.all

  end
end
