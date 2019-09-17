class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_article, only: [:show, :edit, :update, :send_article_email]
  before_action :charge_article_types, only: [:index, :new, :edit]
  before_action :mailing_list_1, only: [:create, :update]
  before_action :mailing_list_2, only: [:create, :update]
  before_action :mailing_list_admin, only: [:create, :update]
  before_action :find_participation, only: [:show]



  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      Author.create!(user_id: current_user.id, article_id: @article.id)
      create_notifications(@article.id, 'article')
      destroy_old_notifications(15)
      redirect_to article_path(@article)
      if @article.send_email_admin
        send_article_email(@list_admins)
      end
      if @article.send_email
        send_article_email(@list_members_1)
        send_article_email(@list_members_2)
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
      Author.create!(user_id: current_user.id, article_id: @article.id)
      if @article.notification?
        update_notifications(@article.id, 'article')
      else
        create_notifications(@article.id, 'article')
      end
      redirect_to article_path(@article)
      if @article.send_email_admin
        send_article_email(@list_admins)
      end
      if @article.send_email
        send_article_email(@list_members_1)
        send_article_email(@list_members_2)
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
      :send_email_admin,
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

  def mailing_list_1
    @list_members_1 = User.where(notification: true)
                        .where(mailing_group: 1)
                        .map{|user| user.email}.join(';')
  end
  def mailing_list_2
    @list_members_2 = User.where(notification: true)
                        .where(mailing_group: 2)
                        .map{|user| user.email}.join(';')
  end

  def mailing_list_admin
    @list_admins = User.where(role: 'admin')
                       .map{|user| user.email}.join(';')
  end

  def send_article_email(users)
    @users = users
    if @article.article_type_id == 6
      ContestMailer.result(@users, @article).deliver_later
    else
      UserMailer.article(@users, @article).deliver_later
    end
  end

  def destroy_old_notifications(period)
    Notification.where("updated_at < ?", Time.now-period.day).destroy_all
  end

  def find_participation
    if !current_user.nil?
      @participation = Participation.where(article_id: @article.id, user_id: current_user.id).first
    end
  end

end
