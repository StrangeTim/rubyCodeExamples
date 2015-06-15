class String
  define_method(:anagrams) do |testwords|
    input_word=self
    input_test_words = testwords
    output_words=[]
    split_word=[]
    input_word_array = self.split("")
    input_word_array = input_word_array.sort()
    testwords.each() do |word|
      split_word = word.split("")
      if split_word.sort() == input_word_array
        output_words.push(word)
      end
    end
    output_words
  end
end
