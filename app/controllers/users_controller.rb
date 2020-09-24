class UsersController < ApplicationController
before_action :find_user, only: [:update, :edit]

  def index
    @users = User.where(member: true)
                 .sort_by{|user| user.lastname}
    @web_subscritpion_users = User.where("member = ? OR member =?", nil, false)
  end

  def update
    @user.update(user_params)
    if @user.save}
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
      :skill_run)

  end
end
