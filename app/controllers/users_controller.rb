class UsersController < ApplicationController
before_action :find_user, only: [:update, :edit]

  def index
    @web_subscritpion_users = User.where(member: nil)

    @active_members = User.where(member: true)

    @alpha_letters = ('A'..'Z').to_a
  end

  def update
    @user.update(user_params)
    if @user.save
      redirect_to edit_user_path(@user)
    else
      render :edit
    end
  end

private
  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :email,
      :firstname,
      :lastname,
      :birthday,
      :mobil_phone,
      :role,
      :profil,
      :office_member,
      :coach,
      :display_profil,
      :member,
      :notification,
      :mailing_group,
      :strava_profil,
      :contactable,
      :skill_swim,
      :skill_bike,
      :skill_run,
      :d3,
      :d3_manager,
      :gender)

  end

end
