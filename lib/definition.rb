class Definition
  @@definitions = {}

  define_method(:initialize) do |words|
    @definition = words
    @position = @@definitions.length()
  end

  attr_reader(:definition, :position)

  define_singleton_method(:all_defs) do
    @@definitions
  end

  define_singleton_method(:clear) do
    @@definitions = {}
  end

  define_method(:add_def) do
    @@definitions[self.position] = self
  end

end
