require "spec_helper"

describe Population do
  before :each do
    $target_phrase = "Genetics are phun"
    @population = Population.new
    @matching_member = DNA.new($target_phrase)
  end

  describe "#new" do
    it "has members" do
      expect(Population.new.members).not_to be_empty
    end
  end

  describe ".is_finished" do
    context "when there is not matching phrase" do
      it "return false" do
        expect(@population.is_finished).to be false
      end
    end

    context "when there is a matching phrase in the population" do
      before { @population.add(@matching_member) }
      it "returns true" do
        expect(@population.is_finished).to be true
      end
    end
  end

  describe ".generate_starting" do
    before { @population.members = [] }
    it "generates a starting population with random data" do
      @population.generate_starting
      expect(@population.members).not_to be_empty
    end
  end

  describe ".calc_fitness" do
    it "returns a ratio of fitness" do
      expect(@population.calc_fitness).to be_an_instance_of Float
    end
  end

end
