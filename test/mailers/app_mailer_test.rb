require 'test_helper'

class AppMailerTest < ActionMailer::TestCase
  test 'sample email renders the headers' do
    mail = ApplicationMailer.sample_email

    assert_equal 'Subject', mail.subject
    assert_equal ['to@example.com'], mail.to
    assert_equal ['from@example.com'], mail.from
  end

  test 'sample email renders the body' do
    mail = ApplicationMailer.sample_email

    assert_match 'Hello', mail.body.encoded
  end
end
