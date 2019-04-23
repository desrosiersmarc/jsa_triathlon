class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_article, only: [:show, :edit, :update]
  before_action :charge_article_types, only: [:index, :new, :edit]


  def index
    # @articles = Article.where(active: true)
                        # .sort_by { |article| article.date}
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article)
      send_article_email
    else
      render :new
    end
  end

  def show
    @reviews = @article.reviews.where('content != ?', '')
                                .sort_by {|review| review.created_at}
                                .reverse
    @review = Review.new

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

  def send_article_email
    UserMailer.article(current_user, @article.article_type.name).deliver_now
  end

end
