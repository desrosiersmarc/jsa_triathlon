class DestroyOldNotificationsJob < ApplicationJob
  queue_as :default

  def perform
    # Notification.where("updated_at < ?", Time.now-15.day).destroy_all
    # Notification.where("created_at < ?", Time.now-15.day).destroy_all
  end
end
