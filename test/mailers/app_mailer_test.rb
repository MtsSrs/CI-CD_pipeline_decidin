# test/mailers/app_mailer_test.rb
require 'rails_helper'

RSpec.describe ApplicationMailer, type: :mailer do
  describe 'sample_email' do
    let(:mail) { ApplicationMailer.sample_email }

    it 'renders the headers' do
      expect(mail.subject).to eq('Subject')
      expect(mail.to).to eq(['to@example.com'])
      expect(mail.from).to eq(['from@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Hello')
    end
  end
end
