class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_article, only: [:show, :edit, :update, :send_article_email]
  before_action :charge_article_types, only: [:index, :new, :edit]
  before_action :mailing_list, only: [:create, :update]
  before_action :find_participation, only: [:show]
  #before_action :find_participation, only: [:show]


  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article)
      if @article.send_email
        @list_members.each do |member|
          send_article_email(member)
        end
      end
    else
      render :new
    end
  end

  def show
    @reviews = @article.reviews.where('content != ?', '')
                                .sort_by {|review| review.created_at}
                                .reverse
    @review = Review.new
    if @participation.nil?
      @participation = Participation.new
    end

    if user_signed_in?
      if @article.likes.map{|r| r.user_id}.include?(current_user.id)
        likes = @article.likes.where(user_id: current_user.id)
        @like = likes.first
        @likes = likes.map{|r| r.like}.reduce(:+)
        case @likes
        when 1
          @method = "patch"
          @label = "Je n'aime plus"
          @class = "btn btn btn-danger"
          @add_like = 0
        when 2..1000
          @method = "patch"
          @label = "Je n'aime plus"
          @class = "btn btn btn-danger"
          @add_like = -1
        else
          @method = "patch"
          @label = "J'aime"
          @class = "btn btn btn-primary"
          @add_like = 1
        end
      else
        @like = Like.new
        @method = "post"
        @label = "J'aime"
        @class = "btn btn btn-primary"
        @add_like = 1
      end
    end

    @likers = likers_list
  end

  def edit
  end

  def update
    @article.update(article_params)
    if @article.save
      redirect_to article_path(@article)
      if @article.send_email
        @list_members.each do |member|
          send_article_email(member)
        end
      end
    else
      render :edit
    end
  end

private
  def article_params
    params.require(:article).permit(
      :name,
      :date,
      :start_time,
      :end_time,
      :location,
      :link,
      :content,
      :user_id,
      :article_type_id,
      :active,
      :send_email,
      :photo)
  end

  def find_article
    @article = Article.find(params[:id])
    send_article = @article
  end

  def charge_article_types
    @article_types = ArticleType.all
  end

  def liker_name(id)
    firstname = User.find(id).firstname.downcase.capitalize
    lastname = User.find(id).lastname[0].downcase.capitalize + "."

    firstname + " " + lastname
  end

  def likers_list
    likers_list = []
    @article.likes.map{|like|
                        if like.like >0
                          like.user_id
                          end
                      }.uniq
                        .each do |user|
                          if !user.nil?
                            likers_list << liker_name(user)
                          end
                       end
    return likers_list
  end

  def mailing_list
    @list_members = User.where(notification: true)
  end

  def send_article_email(user)
    @user = user
    # UserMailer.article(@user, @article).deliver_later
    UserMailer.article(@user, @article).deliver_now
  end

  def find_participation
    if !current_user.nil?
      @participation = Participation.where(article_id: @article.id, user_id: current_user.id).first
    end
  end

end
