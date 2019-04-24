# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/article
  def article
    # UserMailer.article
    @article = Article.last
    user = User.first

    UserMailer.article(user, @article)
  end

end
