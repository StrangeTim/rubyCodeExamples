require ('pry')

class String
  define_method(:friday_review) do |test_phrase|
    count = 0
    clean_test_phrase = test_phrase.input_cleaner  #removes non-alphabetic characters from test consideration. :input verification
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
    return_words = []
    to_sep_words.each() do |word|
      dirty_word = word.split("")
      good_characters = true
      dirty_word.each() do |char|
        if chars_to_compare.include?(char.downcase) == false
          good_characters = false
          word2 = word.split(char)
          return_words.push(word2[0])         #keeps the good part of the current word
          if (word2.length() > 1) && word2[1] != nil
            to_sep_words.push(word2[1])       #ensures any remaining part of the current word still gets tested, if applicable
          end
        end
# binding.pry
      end
      if good_characters
        return_words.push(word)
      end
    end
    return_words
  end
end
