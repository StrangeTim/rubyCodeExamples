class Definition
  @@definitions = []

  define_method(:initialize) do |words|
    @words = words
  end

  attr_reader(:words)

  define_singleton_method(:all_defs) do
    @@definitions
  end

  define_singleton_method(:clear) do
    @@definitions = {}
  end

  define_method(:add_def) do
    @@definitions.push(self.words)
  end

end
