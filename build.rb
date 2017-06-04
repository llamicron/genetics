require_relative "dna"
require_relative "population"

$target_phrase = "VSCode is cool"


population = Population.new
population.add(DNA.new($target_phrase))
puts "true" if population.is_finished

# def evolve
#   # Key Algo right here
#   population.calc_fitness
#   population.natural_selection
#   population.generate
#   population.evaluate

# end

# until population.is_finished
#   evolve
# end

# puts population.inspect
