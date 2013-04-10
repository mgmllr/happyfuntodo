require 'test_helper'

class DailyMailerTest < ActionMailer::TestCase
  test "items_remaining" do
    mail = DailyMailer.items_remaining
    assert_equal "Items remaining", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
