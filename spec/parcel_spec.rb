require 'rspec'
require 'parcel'

describe(Parcel) do
  describe('#volume') do
    it('returns total volume of package') do
      this_box = Parcel.new(25, 15, 10, 2)
      expect(this_box.volume).to(eq(3750))
    end
  end

  #describe
    #it
    #end
  #end
end
