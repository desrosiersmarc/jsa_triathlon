class ParticipationsController < ApplicationController
  before_action :find_article, only: [:new, :create, :edit, :update]
  before_action :find_participation, only: [:edit, :update]

  def new
    @participation = Participation.new
  end

  def create
    @participation = Participation.new(participation_params)
    @participation.user_id = current_user.id
    @participation.article_id = @article.id
    if @participation.save
      redirect_to article_path(@article)
    end

  end

  def edit
  end

  def update
    @participation.update(participation_params)
    if @participation.save
      redirect_to article_path(@article)
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
