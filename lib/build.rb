require "pry"
require_relative "dna"
require_relative "fitness"
require_relative "population"

$target_phrase = "VSCode is cool"
population = Population.new

pry.start

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
