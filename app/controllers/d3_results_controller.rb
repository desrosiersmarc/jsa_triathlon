class D3ResultsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @d3_results = D3Result.all
  end

  def new
    @d3_result = D3Result.new
    # @d3_competitors = User.where(d3: true).map{|user| user.id}
    @d3_competitors = User.where(d3: true)
    @d3_contests = D3Contest.where('extract(year from date) = ?', Time.now.year)
  end

  def create
    @d3_result = D3Result.new(d3_result_params)
    if @d3_result.save
      redirect_to la_division_3_path
    else
      render :new
    end
  end

  private

  def d3_result_params
    params.require(:d3_result).permit(
      :d3_contest_id,
      :user_id,
      :rank,
      :swim,
      :t1,
      :bike,
      :t2,
      :run,
      :total)
  end
end
