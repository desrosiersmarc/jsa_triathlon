class PartnersController < ApplicationController
  skip_before_action :authenticate_user!, only:[:index]
  before_action :find_partner, only:[:edit, :update]

  def index
    @partners = Partner.all
  end

  def new
    @partner = Partner.new
  end

  def create
    @partner = Partner.new(partner_params)
    if @partner.save
      redirect_to partners_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @partner.update(partner_params)
    if @partner.save
      redirect_to partners_path
    else
      render :edit
    end
  end

private
  def partner_params
    params.require(:partner).permit(
      :user_id,
      :name,
      :contact,
      :offer,
      :website,
      :address,
      :description,
      :active,
      :photo)

  end

  def find_partner
    @partner = Partner.find(params[:id])
  end
end
