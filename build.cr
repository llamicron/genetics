require "./dna"
require "./population"

population = Population.new

def run
  # Key Algo right here
  population.calc_fitness
  population.natural_selection
  population.generate
  population.evaluate

  if population.is_finished
    puts "done"
    abort
  end
end
