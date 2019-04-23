# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/article
  def article
    # UserMailer.article
    user = User.first
    # @article_path = " https://jsa-triathlon.herokuapp.com/articles/" + Article.last.id.to_s
    @article_path = "http://localhost:3000/articles/" + Article.last.id.to_s
    UserMailer.article(user)
  end

end
