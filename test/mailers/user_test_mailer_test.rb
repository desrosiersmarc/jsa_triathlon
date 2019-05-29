require 'test_helper'

class UserTestMailerTest < ActionMailer::TestCase
  test "email_test" do
    mail = UserTestMailer.email_test
    assert_equal "Email test", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
