require 'pony'

module SecretBambino
  class Mail
    class << self
      def test(email_address, message)
        send(email_address, 'This is a test', message)
      end

      def send(email_address, subject, message, html_message=nil)
        Pony.mail(options(email_address, subject, message, html_message))
      end

      private

      def options(email_address, subject, message, html_message)
        {
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
          :subject => subject,
          :body => message,
          :html_body => (html_message unless html_message.to_s.empty?)
        }
      end
    end
  end
end
