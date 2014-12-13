require 'erb'
require 'ostruct'

module SecretBambino
  class Renderer
    TEMPLATES_PATH = "../../../templates"

    def render(var_hash, html=false)
      template = html ? html_template : plain_template
      variables = OpenStruct.new(var_hash)
      ERB.new(template).result(variables.instance_eval { binding })
    end

    private

    def plain_template
      @plain_template ||= load_template('message.txt.erb')
    end

    def html_template
      @html_template ||= load_template('message.html.erb')
    end

    def load_template(filename)
      File.read(File.expand_path(File.join(TEMPLATES_PATH, filename), __FILE__))
    end
  end
end
