class Word
  @@dictionary = {}

  define_method(:initialize) do |attributes|
    @word = attributes.fetch(:word)
    @definition = attributes.fetch(:definition)
  end

  attr_reader(:word, :definition)

  define_singleton_method(:all_words) do
    @@dictionary
  end

  define_singleton_method(:clear) do
    @@dictionary = {}
  end

  define_method(:add_word) do
    @@dictionary[self.word()] = self.definition()
  end

end
