require 'thor'
require_relative 'secret_bambino'

class Commands < Thor
  desc "test EMAIL_ADDRESS MESSAGE", "Send the specified test message to the specified email address."
  def test(email_address, message)
    SecretBambino::Mail.test(email_address, message)
  end

  desc "assign BAMBINOS_YAML", "Assign and send assignments to Secret Bambinos in specified YAML file."
  def assign(bambinos_yaml)
    SecretBambino.assign(bambinos_yaml)
  end
end
