class D3ContestsController < ApplicationController
  skip_before_action :authenticate_user!, only:[]
  before_action :charge_contest_types, only:[:index, :new, :edit, :create]
  def index
    @d3_contests = D3Contest.all
  end

  def new
    @d3_contest = D3Contest.new
  end

  def create
    @d3_contest = D3Contest.new(d3_contest_params)
    if @d3_contest.save
      redirect_to d3_contests_path
    else
      render :new
    end
  end

  def edit
  end

  def division_3
    @d3_contests = D3Contest.where('date < ?', Date.civil(Time.now.year, 12,31))
                            .where('date > ?', Date.civil(Time.now.year,1,1))
                            .sort_by{ |contest| contest.date}

  end

private
  def d3_contest_params
    params.require(:d3_contest).permit(
      :name,
      :location,
      :date,
      :contest_type_id)
  end

  def charge_contest_types
    @contest_types = ContestType.all
  end


end
