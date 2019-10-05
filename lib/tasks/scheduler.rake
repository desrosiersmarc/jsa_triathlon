desc "This task is called by the Heroku scheduler add-on"
task :destroy_old_notifications => :environment do
  Notification.where("updated_at < ?", Time.now-15.day).destroy_all

  Notification.where("created_at < ?", Time.now-15.day)
              .map{|notif| if  notif.created_at == notif.updated_at then notif end}
              .each do |notif|
                notif.delete
              end

  Notification.where(read: true)
              .each do |notif|
                notif.delete
              end

end

task :newsletter => :environment do
  if Time.now.day.odd?
    UserTestMailer.email_test("mdesrosiers@orange.fr").deliver
  end
end

