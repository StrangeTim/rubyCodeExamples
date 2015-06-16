require('rspec')
require('playlist')

describe(CD) do

  before() do
    CD.clear()
  end

  describe('#add_cd') do
    it("adds cd to playlist") do
      new_cd = CD.new("Jagged Little Pill")
      expect(new_cd.add_cd()).to(eq([new_cd]))
    end
  end

  describe('.title_alpha') do
    it("sorts current cds by title only") do
      new_cd = CD.new("Jagged Little Pill")
      new_cd.add_cd()
      new_cd = CD.new("Broken Rearview")
      new_cd.add_cd()
      new_cd = CD.new("Kid A")
      new_cd.add_cd()
      new_cd = CD.new("76 Trombones")
      new_cd.add_cd()
      expect(CD.title_alpha()).to(eq(["76 Trombones", "Broken Rearview", "Jagged Little Pill", "Kid A"]))
    end
  end

end
