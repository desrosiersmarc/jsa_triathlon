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
  # if Time.now.day == 1
    club_events = article_by_type(1)
    training_events = article_by_type(2)
    next_contests = article_by_type(3)
    last_results = article_by_type(6)
    tri_school = article_by_type(4)
    various_articles = article_by_type(9)
    # pictures
    # ads

    UserMailer.newsletter(club_events,
                          training_events,
                          next_contests,
                          last_results,
                          tri_school,
                          various_articles).deliver


  # end


end

def article_by_type(type)
  Article.where(article_type: type)
         .where('updated_at >= ?', Time.now-30.day)
end
