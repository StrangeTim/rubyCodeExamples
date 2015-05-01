class Word
  @@dictionary = {}

  define_method(:initialize) do |attributes|

  end

  define_singleton_method(:all) do
    @@dictionary
  end

  define_singleton_method(:clear) do
    @@dictionary = {}
  end

  define_method(:blarg) do

  end

end
