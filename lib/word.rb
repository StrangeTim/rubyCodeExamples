class Word
  @@dictionary = {}

  define_method(:initialize) do |word|
    @word = word.downcase
    @definition = nil
  end

  attr_reader(:word, :definition)

  define_singleton_method(:all_words) do
    @@dictionary
  end

  define_singleton_method(:clear) do
    @@dictionary = {}
  end

  define_method(:add_def) do |definition|
    current_def = @@dictionary.fetch(self)
    if current_def != nil
      current_def += "/n" + definition
    else
      current_def = definition
    end
    @@dictionary[self] = current_def
  end

  define_method(:add_word) do
    @@dictionary[self.word()] = self.definition()
  end

end
