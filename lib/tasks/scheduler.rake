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
  if Time.now.strftime('%d').to_i == 2
    newsletter_content(mailing_list_1)
    newsletter_content(mailing_list_2)
  end
end

task :newsletter_test => :environment do
    newsletter_content(mailing_list_admin, "Projet qui partira le 2 janvier 2020")
end

  def article_by_type_past(type)
    articles = Article.where(article_type: type)
                      .where(active: true)
                      .where('date >= ?', Time.now-30.day)
                      .sort_by {|article| article.date}
    if articles.count > 3
      return articles.take(3)
    else
      return articles
    end
  end

  def article_by_type_next(type)
    articles = Article.where(article_type: type)
                      .where(active: true)
                      .where('date >= ?', Time.now)
                      .sort_by {|article| article.date}
    if articles.count > 3
      return articles.take(3)
    else
      return articles
    end
  end

def birthday_list_method
  birthday_list = []
  User.all.each do |user|
    if user.birthday?
      if user.birthday.month == Time.now.month
        birthday_list << user
      end
    end
  end
  return birthday_list
end

def newsletter_content(users, alert)
    club_events = article_by_type_next(1)
    training_events = article_by_type_next(2)
    next_contests = article_by_type_next(3)
    last_results = article_by_type_past(6)
    tri_school = article_by_type_past(4)
    various_articles = article_by_type_past(9)
    birthdays = birthday_list_method
    pictures = Picture.last
    ads_count = Product.where(product_type_id: 2).count

    UserMailer.newsletter(users,
                          alert,
                          club_events,
                          training_events,
                          next_contests,
                          last_results,
                          tri_school,
                          various_articles,
                          birthdays,
                          pictures,
                          ads_count).deliver
end

def mailing_list_admin
  @list_admins = User.where(role: 'admin')
                     .map{|user| user.email}.join(';')
end

def mailing_list_1
  @list_members_1 = User.where(notification: true)
                      .where(mailing_group: 1)
                      .map{|user| user.email}.join(';')
end
def mailing_list_2
  @list_members_2 = User.where(notification: true)
                      .where(mailing_group: 2)
                      .map{|user| user.email}.join(';')
end
