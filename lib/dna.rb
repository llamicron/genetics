class DNA
  attr_accessor :data
  attr_reader :fitness

  def initialize(data)
    @data = data
    @fitness = 0.0

    calc_fitness
  end

  def calc_fitness
    count = 0.0
    $target_phrase.length.times do |position|
      if @data[position] == $target_phrase[position]
        count += 1.0
      end
    end

    @fitness = count / $target_phrase.length

    if @fitness == 1.0
      data_copy = @data.dup
      data_copy.slice! $target_phrase
      if data_copy.empty?
        $finished = true
        return true
      else
        data_copy.each_char do
          @fitness -= 1.0 / $target_phrase.length
        end
      end
    end
    return @fitness
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
