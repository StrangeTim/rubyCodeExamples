require ('pry')

class String
  define_method(:friday_review) do |test_phrase|
    count = 0
    clean_test_phrase = test_phrase.input_cleaner  #removes non-english characters from test consideration. :input verification
    clean_test_phrase.each() do |word|
      if self == word
        count += 1
      end
    end
    count
  end
end




class String
  define_method(:input_cleaner) do
    chars_to_compare = ('a'..'z')
    to_sep_words = self.split()
    to_sep_words.each() do |word|
# binding.pry
      dirty_word = word.split("")
      dirty_word.each() do |char|
# binding.pry
        if chars_to_compare.include?(char.downcase) == false
          word2 = word.slice!(char)
          if (word2.length() > 0) && word2[1] != nil
            to_sep_words.push(word2[1])    # appends separated string to the end of the separate words array to ensure it also gets tested
            word = word2[0]     # keeps clean string
          else
            word = word2
          end
        end
      end
    end
    to_sep_words
  end
end
