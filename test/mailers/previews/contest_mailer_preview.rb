# Preview all emails at http://localhost:3000/rails/mailers/contest_mailer
class ContestMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/contest_mailer/result
  def result
    article = Article.last
    ContestMailer.result(article)
  end

end
