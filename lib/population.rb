require_relative "dna"
require_relative "fitness"

class Population

  attr_reader :fitness
  attr_accessor :members

  def initialize
    @members = []
    @starting_population_count = 100
    @fitness = Fitness.new

    generate_starting
  end

  # This is a key method to change when adapting the algo
  def is_finished
    raise "No target phrase set. Please make a global var called $target_phrase" unless $target_phrase
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
    if is_finished
      return @fitness.score = 1
    end

    @members.each do |member|
      @fitness.score += member.calc_fitness
    end
    @fitness.score = @fitness.score / @members.length
  end

  def add(member)
    raise "Member must be of type DNA" unless member.is_a? DNA
    @members.push(member)
  end

end
