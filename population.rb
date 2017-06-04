require_relative "dna"

class Population

  attr_reader :members, :overall_fitness

  def initialize
    @members = []
    @starting_population_count = 100
    @overall_fitness = 0.0

    generate_starting
  end

  # This is a key method to change when adapting the algo
  def is_finished
    @members.each do |member|
      if member.data == $target_phrase
        return true
      end
    end
    return false
  end

  def generate_starting
    @starting_population_count.times do
      @members.push(DNA.new(('a'..'z').to_a.shuffle[0,$target_phrase.length].join))
    end
  end

  def calc_fitness
    @members.each do |member|
      @overall_fitness += member.calc_fitness
    end
    @overall_fitness = @overall_fitness / @members.length
  end

  def add(member)
    raise "Member must be of type DNA" unless member.is_a? DNA
    @members.push(member)
  end

end
