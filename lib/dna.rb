class DNA
  attr_reader :data

  def initialize(phrase)
    @data = phrase
    @fitness = 0.0
  end

  def calc_fitness
    count = 0.0
    $target_phrase.length.times do |position|
      if @data[position] == $target_phrase[position]
        count += 1.0
      end
    end
    @fitness = count / $target_phrase.length
  end
end
