require "pry"
require_relative "dna"
require_relative "population"

$target_phrase = "VSCode is cool"
population = Population.new

until population.is_finished
  # Key Algo right here
  population.calc_fitness
  # These 2 should be called together, in this order
  population.natural_selection
  population.generate
  puts population.best_member.data
  # population.evaluate
end
