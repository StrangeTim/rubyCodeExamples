require 'rspec'
require 'word'
require 'pry'

describe(Word) do

  before() do
    Word.clear()
  end

  describe('#add_word') do
    it("adds a word to the class variable and properly displays it as key/value pair.") do
      test_word = Word.new({:word => "Superfluous",:definition => nil})
      test_word.add_word
      expect(Word.all_words).to(eq({"Superfluous" => nil}))
    end
  end

end
