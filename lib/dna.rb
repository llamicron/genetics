class DNA
  attr_accessor :data
  attr_reader :fitness

  def initialize(data)
    @data = data
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

  def crossover(parent)
    child_data = ""
    @data.length.times do |x|
      if @data[x] == $target_phrase[x]
        child_data += @data[x]
      end
      if parent.data[x] == $target_phrase[x]
        child_data += parent.data[x]
      end
    end
    return DNA.new(child_data)
  end

end
