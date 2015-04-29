class Artist
  @@artist_list = {}

  define_method(:initialize) do |name|
    @name = name
    @titles = []
  end

  define_singleton_method(:clear) do
    @@artist_list = {}
  end

  define_singleton_method(:all) do
    @@artist_list
  end

  define_method(:add_artist) do
    @@artist_list.store(@name,@titles)
  end

  define_method(:get_name) do
    @name
  end

  define_singleton_method(:add_title) do |name, cd_title|
    new_titles = @@artist_list.fetch(name)
    new_titles.push(cd_title)
    @@artist_list[name] = new_titles
  end


end
