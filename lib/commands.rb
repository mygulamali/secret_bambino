require 'thor'
require_relative 'secret_bambino'

class Commands < Thor
  desc "test EMAIL_ADDRESS MESSAGE", "Send the specified test message to the specified email address."
  def test(email_address, message)
    SecretBambino::Mail.test(email_address, message)
  end
end
