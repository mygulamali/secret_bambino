module SecretBambino
  class Bambinos
    def initialize(filename)
      load_from_yaml(filename)
    end

    def assigned_bambinos
      @assigned_bambinos ||= shuffle(@bambinos)
    end

    private

    def load_from_yaml(filename)
      data = YAML::load(File.open(filename))
      @bambinos = data['bambinos']
    end

    # variant of Fisher-Yates shuffle (ie. not the same as array.shuffle)
    def shuffle(ary)
      ary_dup = ary.dup
      n = ary_dup.length
      (0...n).each do |i|
        j = rand([i+1, n-1].min...n)
        ary_dup[i], ary_dup[j] = ary_dup[j], ary_dup[i]
      end
      ary_dup
    end
  end
end
