require 'spec_helper'

describe DNA do
  before :all do
    $target_phrase = "target phrase"
  end

  before :each do
    @member = DNA.new('heres a phrase')
  end

  describe 'paramaters' do
    it 'has paramaters' do
      expect(@member.data).not_to be_empty
      expect(@member.fitness).not_to be_nil
    end
  end

  describe ".calc_fitness" do
    context "when there is an exact match" do
      it "will return 1.0" do
        member = DNA.new($target_phrase)
        expect(member.fitness).to eq(1.0)
      end
    end

    context "when there is not an exact match" do
      it "will return a ratio of fitness" do
        member = DNA.new($target_phrase + "2")
        expect(member.fitness).to be < 1.0
        member.data = $target_phrase.delete("e")
        expect(member.calc_fitness).to be < 1.0
      end
    end
  end
end
