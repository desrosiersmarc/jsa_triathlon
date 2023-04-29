class UsersController < ApplicationController
before_action :find_user, only: [:update, :edit]

  def index
    @web_subscritpion_users = User.where(member: nil)
                                  .sort_by{|web_subscritpion_user| web_subscritpion_user.created_at}
                                  .reverse

    @active_members = User.where(member: true)

    @alpha_letters = ('A'..'Z').to_a
  end

  def update
    @user.update(user_params)
    if @user.save
      user_name_merge(@user)
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
      :gender,
      :name)
  end

  def user_name_merge(user)
    user.update(name: @user.firstname + " " + @user.lastname)
  end

end
