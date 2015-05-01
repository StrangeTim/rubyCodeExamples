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

  define_singleton_method(:key_sort) do
    dictionary2 = {}
    just_keys = @@dictionary.keys.sort
    just_keys.each() do |key|
      dictionary2[key] = @@dictionary.fetch(key)
    end
    @@dictionary = dictionary2
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
