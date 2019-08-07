class NotificationsController < ApplicationController

  def index
    @my_notifications = Notification.where(user_id: current_user.id)
  end
end
