require "pry"
require_relative "dna"
require_relative "population"

$target_phrase = "VSCode is cool"

population = Population.new
puts population.members
# until population.is_finished
#   population.evolve
# end
