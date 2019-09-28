desc "This task is called by the Heroku scheduler add-on"
task :destroy_old_notifications => :environment do
  puts "I will destroy all old notifications oldest than 15 days"
  puts "First I destroy notifications with a updated date"
  Notification.where("updated_at < ?", Time.now-15.day).destroy_all
  puts "Second, I'm destroying notifications with a created date"
  Notification.where("created_at < ?", Time.now-15.day)
              .map{|notif| if  notif.created_at == notif.updated_at then notif end}
              .each do |notif|
                notif.delete
              end

  puts "done."

  #Destroy notification oldest than 15 days
  #Find notification where created_at == updated_at
  #if created_at > 15 days => destroy
  #
  #For other notifications, destroy them i updated_at > 15 days
end
