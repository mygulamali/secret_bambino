module SecretBambino
  class Bambinos
    def init(filename)
      load_from_yaml(filename)
    end

    private

    def load_from_yaml(filename)
      data = YAML::load(File.open(filename))
      @bambinos = data['bambinos']
    end    
  end
end
