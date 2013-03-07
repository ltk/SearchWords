require 'spec_helper'

describe Phrase do
  let(:phrase) { Phrase.new(" some Phrase", "1,234") }

  describe "#words" do
    it "returns an array of word objects" do
      pending "How do you test for object equivalence in an array?"
      # phrase.words.should match_array([Word.new("some",1234), Word.new("phrase",1234)])
    end
  end

  describe "#tally" do
    it "calls #tally on each word in the words array" do
      word = double()
      phrase.stub(:words).and_return([word, word])
      word.should_receive(:tally).exactly(2).times
      phrase.tally
    end
  end
end
