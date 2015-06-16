require 'rspec'
require 'artist_list'

describe(Artist) do
  before() do
    Artist.clear()
  end

  describe("#add_title") do
    it("adds a title to a current artist and saves it") do
      this_guy = Artist.new("Wierd Al")
      this_guy.add_artist()
      this_cd = CD.new("Running With Scissors")
      this_cd.add_cd()
      Artist.add_title((this_guy.get_name()) , (this_cd.get_title()))
      expect(Artist.all()).to(eq({"Wierd Al" => ["Running With Scissors"]}))
    end
  end
  describe("#add_title") do
    it("adds a second title to a current artist and saves it") do
      this_guy = Artist.new("Wierd Al")
      this_guy.add_artist()
      this_cd = CD.new("Running With Scissors")
      this_cd.add_cd()
      Artist.add_title(this_guy.get_name() , this_cd.get_title())
      this_cd = CD.new("The Food Album")
      this_cd.add_cd()
      Artist.add_title((this_guy.get_name()) , (this_cd.get_title()))
      expect(Artist.all()).to(eq({"Wierd Al" => ["Running With Scissors", "The Food Album"]}))
    end
  end

end
