require 'test_helper'

class DiversMailerTest < ActionMailer::TestCase
  test "divers_article" do
    mail = DiversMailer.divers_article
    assert_equal "Divers article", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
