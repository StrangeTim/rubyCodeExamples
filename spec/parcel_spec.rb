require 'rspec'
require 'parcel'

describe(Parcel) do
  describe('#volume') do
    it('returns total volume of package') do
      this_box = Parcel.new(25, 15, 10, 2)
      expect(this_box.volume).to(eq(3750))
    end
  end

  describe('#cost') do
    it('calculates the cost to ship from point a to point b') do
      this_box = Parcel.new(25, 15, 10, 2)
      expect(this_box.cost(100)).to(eq(41.6))
    end
  end
end
