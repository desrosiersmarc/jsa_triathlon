class NotificationsController < ApplicationController
  before_action :find_notification, only: [:edit, :update]

  def index
    @my_notifications = Notification.where(user_id: current_user.id)
                                    .sort_by {|notification| notification.updated_at}
                                    .reverse
  end

  def edit

  end

  def update
    @notification.update(notification_params)
    if @notification.save
      redirect_to notifications_path
    else
      render :edit
    end
  end

private

  def find_notification
    @notification = Notification.find(params[:id])
  end

  def notification_params
    params.require(:notification).permit(
      :article_id,
      :picture_id,
      :product_id,
      :read,
      :user_id)
  end

end
