require_relative "dna"

class Population

  attr_accessor :members

  def initialize
    @members = starting_population(100)
  end


  def starting_population(count)
    members = []
    count.times do
      members.push(DNA.new(('a'..'z').to_a.shuffle[0,$target_phrase.length].join))
    end
    return members
  end

  def is_finished
    raise "No target phrase set. Please make a global var called $target_phrase" unless $target_phrase

    @members.each do |member|
      if member.fitness == 1
        return true
      end
      # if member.data == $target_phrase
      #   $finished = true
      #   return true
      # end
    end
    return false
  end
  #
  # def calc_fitness
  #   if is_finished
  #     return @fitness = 1
  #   end
  #
  #   @members.each do |member|
  #     @fitness += member.calc_fitness
  #   end
  #   @fitness = @fitness / @members.length
  # end

  # def add(member)
  #   raise "Member must be of type DNA" unless member.is_a? DNA
  #   @members.push(member)
  # end

  # def random_member
  #   @members.sample
  # end

  # def sort_by_fitness
  #   @members.sort_by! {|member| member.fitness}.reverse!
  # end

  # def natural_selection
  #   while true do
  #     member = @members.sample
  #     r = rand(0..100)
  #     if r < member.fitness * 100
  #       return member
  #     end
  #   end
  # end

  # def generate
  #   new_generation = []
  #   @members.each do |member|
  #     new_generation.push(member.crossover(random_member))
  #   end
  #   @members = new_generation
  # end

  # def best_member
  #   sort_by_fitness
  #   return @members[0]
  # end

end
