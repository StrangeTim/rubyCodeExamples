require 'rspec'
require 'word'
require 'pry'

describe(Word) do

  before() do
    Word.clear()
  end

  describe('#dictionary_add') do
    it("adds a word to the class variable and properly displays it as key/value pair.") do
      test_word = Word.new("Superfluous")
      test_word.dictionary_add
      test_word.list_add
      expect(Word.dictionary).to(eq({"superfluous" => nil}))
      expect(Word.all_words.fetch(0)).to(eq(test_word))
    end
  end
end
