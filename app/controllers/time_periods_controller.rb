class TimePeriodsController < ApplicationController
before_action :find_time_period, only: [:show]

  def index
    @time_period_parents = TimePeriod.where(ancestry: nil)
                                     .reverse
    @time_period_articles = Article.where(time_period_id: Article.last.time_period_id)
  end

  def show
    @time_period_parents = TimePeriod.where(ancestry: nil)
                                     .reverse
  end

private
  def find_time_period
    @time_period = TimePeriod.find(params[:id])
  end

end
