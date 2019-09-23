desc "This task is called by the Heroku scheduler add-on"
task :destroy_old_notifications => :environment do
  puts "I will destroy all old notifications oldest than 15 days"
  puts "I'm doing something"
  puts "done."
end
