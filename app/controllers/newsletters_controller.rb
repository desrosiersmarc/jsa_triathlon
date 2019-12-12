class NewslettersController < ApplicationController
  before_action :find_newsletter, only: [:edit, :update]

  def index
    @newsletter_chapters = Newsletter.all.sort_by{|newsletter| newsletter.id}
  end

  def edit
  end

  def update
    @newsletter.update(newsletter_params)
    if @newsletter.save
      redirect_to newsletters_path
    else
      render :edit
    end
  end

  private
  def find_newsletter
    @newsletter = Newsletter.find(params[:id])
  end

  def newsletter_params
    params.require(:newsletter).permit(
      :name,
      :content)
  end
end
