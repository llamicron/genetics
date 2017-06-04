require_relative "dna"

class Population

  attr_reader :fitness
  attr_accessor :members

  def initialize
    @members = []
    @starting_population_count = 100
    @fitness = 0.0

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
      return @fitness = 1
    end

    @members.each do |member|
      @fitness += member.calc_fitness
    end
    @fitness = @fitness / @members.length
  end

  def add(member)
    raise "Member must be of type DNA" unless member.is_a? DNA
    @members.push(member)
  end

  def random_member
    @members.sample
  end

  def sort_by_fitness
    @members.sort_by! {|member| member.fitness}.reverse!
  end

  # Pool selection. Needs improvement.
  def natural_selection
    # Sort by fitness and keep the top 50 members
    sort_by_fitness
    @members = @members.take(50)
  end

  def generate
    new_generation = []
    @members.each do |member|
      new_generation.push(member.crossover(random_member))
    end
    @members += new_generation
  end

  def best_member
    sort_by_fitness
    return @members[0]
  end

end
