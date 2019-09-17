class DestroyOldNotificationsJob < ApplicationJob
  queue_as :default

  def perform
    Notification.where("updated_at < ?", Time.now-0.day).destroy_all
  end
end
