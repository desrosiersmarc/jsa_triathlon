# Preview all emails at http://localhost:3000/rails/mailers/divers_mailer
class DiversMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/divers_mailer/divers_article
  def divers_article

    DiversMailer.divers_article
  end

end
