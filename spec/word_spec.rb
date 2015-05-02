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

  describe('#add_def') do
    it("adds a definition to an existing word and verifies proper storage") do
      test_word = Word.new("Superfluous")
      test_def = Definition.new("completely totally 100% unneccessary")
      test_def.add_def
      test_word.dictionary_add
      test_word.list_add
      test_word.add_def(test_def)
      expect(Word.dictionary).to(eq({"superfluous" => "completely totally 100% unneccessary"}))
      expect(Word.all_words.fetch(0)).to(eq(test_word))
    end
  end
end
