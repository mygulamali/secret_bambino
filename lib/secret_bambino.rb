require_relative 'secret_bambino/bambinos'
require_relative 'secret_bambino/mail'
require_relative 'secret_bambino/renderer'

module SecretBambino
  class << self
    def assign(bambinos_yaml)
      bambinos = SecretBambino::Bambinos.new(bambinos_yaml)
      renderer = SecretBambino::Renderer.new

      bambinos.each_with_index do |bambino, i|
        assigned_bambino = bambinos.assigned_bambinos[i]
        message = renderer.render({bambino: bambino, assigned_bambino: assigned_bambino})
        html_message = renderer.render({bambino: bambino, assigned_bambino: assigned_bambino}, true)
        SecretBambino::Mail.send(bambino['email'], 'Secret Bambino: Your assignment', message, html_message)
        puts "Sent Secret Bambino assignment to #{bambino['name']} (#{bambino['email']})"
      end
    end

    def test(email_address)
      bambino = {
        'name' => 'John Doe',
        'email' => 'john.doe@example.com'
      }
      assigned_bambino = {
        'name' => 'Jane Doe',
        'email' => 'jane.doe@example.com'
      }
      renderer = SecretBambino::Renderer.new
      message = renderer.render({bambino: bambino, assigned_bambino: assigned_bambino})
      html_message = renderer.render({bambino: bambino, assigned_bambino: assigned_bambino}, true)
      SecretBambino::Mail.send(email_address, 'This is a test', message, html_message)
    end
  end
end
