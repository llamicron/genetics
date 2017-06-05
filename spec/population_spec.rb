require "spec_helper"

describe Population do

  before :all do
    $target_phrase = "target phrase"
  end

  before :each do
    population = Population.new
  end


  describe "#new" do
    it "populates with members with random data" do
      expect(Population.new.members).to be_an_instance_of Array
    end
  end


end
