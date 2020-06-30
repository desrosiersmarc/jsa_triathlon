class NewslettersController < ApplicationController
  before_action :find_newsletter, only: [:edit, :update]
  skip_before_action :authenticate_user!,
                      only: []

  def index
    @newsletter_chapters = Newsletter.all.sort_by{|newsletter| newsletter.id}
    # @newsletter_setup = Newsletter.find(1)
    @newsletter = Newsletter.find(1)
  end

  def edit
  end

  def update
    @newsletter.update(newsletter_params)
    if @newsletter.save
      # redirect_to newsletters_path
      respond_to do |format|
        format.html {redirect_to newsletters_path}
        format.js
      end
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
      :content,
      :send_newsletter,
      :send_newsletter_date)
  end
end
