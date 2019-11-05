require 'test_helper'

class AdMailerTest < ActionMailer::TestCase
  test "new_ad" do
    mail = AdMailer.new_ad
    assert_equal "New ad", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
