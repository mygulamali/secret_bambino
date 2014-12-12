require 'pony'
require 'thor'

class Commands < Thor
  desc "test EMAIL_ADDRESS MESSAGE", "Send the specified message to the specified email address."
  def test(email_address, message)
    Pony.mail({
      :to => email_address,
      :via => :smtp,
      :via_options => {
        :address => ENV['GMAIL_SMTP_SERVER'],
        :port => ENV['GMAIL_SMTP_PORT'],
        :enable_starttls_auto => true,
        :user_name => ENV['GMAIL_SMTP_USERNAME'],
        :password => ENV['GMAIL_SMTP_PASSWORD'],
        :authentication => :plain,
        :domain => ENV['DOMAIN']
      },
      :from => ENV['FROM_ADDRESS'],
      :subject => 'This is a test',
      :body => message
    })
  end
end
