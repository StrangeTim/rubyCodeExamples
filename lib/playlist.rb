class CD
@@playlist=[ ]

  define_method(:initialize) do |title|
    @id = @@playlist.length().+(1)
    @title = title
    @artist = nil
  end

  define_singleton_method(:clear) do
    @@playlist = []
  end

  define_method(:add_cd) do
    @@playlist.push(self)
  end

  define_method(:add_artist) do
    @artist = self
  end

  define_method(:get_title) do
    @title
  end

  define_singleton_method(:title_alpha) do
    ordered_list = []
    current_title = ""
    until ordered_list.length() == @@playlist.length() do
      @@playlist.each() do |current_cd|
        ordered_list.push(current_cd.get_title())
      end
    end
    ordered_list.sort!()
  end

end
