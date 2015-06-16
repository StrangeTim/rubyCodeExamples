class Word
  @@dictionary = {}  # stores word(string) as key and definition as value
  @@words_list = {}  # stores word(string) as key and all additional Word Class information.

  define_method(:initialize) do |word|
    @word = word.downcase
    @definition = nil
    @position = @@words_list.length()
  end

  attr_reader(:word, :definition, :position)

  define_singleton_method(:dictionary) do
    @@dictionary
  end

  define_singleton_method(:all_words) do
    @@words_list
  end

  define_singleton_method(:clear) do
    @@dictionary = {}
    @@words_list = {}
  end

  define_method(:add_def) do |new_definition|
    @definition = new_definition
    self.list_add()
    self.dictionary_add()
  end

  define_method(:dictionary_add) do
    @@dictionary[self.word()] = self.definition()
  end

  define_method(:list_add) do
    @@words_list[self.position()] = self
  end

end
