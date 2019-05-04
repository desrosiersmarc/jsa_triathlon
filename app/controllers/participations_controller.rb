class ParticipationsController < ApplicationController
  before_action :find_article, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_participation, only: [:destroy]

  def new
    @participation = Participation.new
  end

  def create
    @participation = Participation.new(participation_params)
    @participation.user_id = current_user.id
    @participation.article_id = @article.id
    if @participation.save
      respond_to do |format|
        format.html {redirect_to article_path(@article)}
        format.js
      end
    end
  end

  def destroy
    if @participation.delete
      respond_to do |format|
        format.html {}
        format.js
      end
    end
  end

private
  def find_participation
    @participation = Participation.find(params[:id])
  end

  def participation_params
    params.require(:participation).permit(:status, :user_id, :article_id)
  end

  def find_article
    @article = Article.find(params[:article_id])
  end
end
