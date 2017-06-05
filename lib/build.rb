require "pry"

require_relative "dna"
require_relative "population"

$target_phrase = "VSCode is cool"

population = Population.new

until population.is_finished
  population.generate
  # puts population.members.length
  puts population.best_member.data.inspect
end
