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
end
