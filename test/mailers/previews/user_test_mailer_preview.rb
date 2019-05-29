# Preview all emails at http://localhost:3000/rails/mailers/user_test_mailer
class UserTestMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_test_mailer/email_test
  def email_test
    UserTestMailer.email_test
  end

end
