require "pry"
require_relative "dna"
require_relative "population"

$target_phrase = "VSCode is cool"
population = Population.new

# until population.is_finished
  # Key Algo right here
  population.calc_fitness
  population.natural_selection
  # population.generate
  # population.evaluate
# end
