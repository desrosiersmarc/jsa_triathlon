class ClubsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :impots ]
  before_action :find_club, only: [:new, :edit, :show, :update]


  def new
    @club = Club.new
  end

  def create
    @club = Club.new(club_params)

    if @club.save
      redirect_to clubs_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @club.update(club_params)
    if @club.save
      redirect_to clubs_path
    else
      render :edit
    end
  end


  def index
    # @clubs = Article.where(article_type: 7) + Article.where(article_type: 8)
    @clubs = Club.all
    @users_to_display = User.where(display_profil: true).where(member: true)
    @users = @users_to_display.sort_by { |member| member.lastname.upcase}
    @office_members = @users_to_display.where(office_member: true).sort_by { |member| member.lastname}
    @coachs = @users_to_display.where(coach: true).sort_by { |member| member.lastname}
  end

  def finances
  end

  def impots
    # @impots = Article.where(article_type: 8).first
  end

private
  def find_club
    @club = Club.find(params[:id])
  end

  def club_params
    params.require(:club).permit(
      :content,
      :user_id)
  end


end
