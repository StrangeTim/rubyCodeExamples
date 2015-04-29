require('rspec')
require('car_desc')
require('car_dealer')

describe(CarDealer) do
  before() do
    CarDealer.clear()
  end

  describe('#add_dealer') do
    it("adds a new dealer to list of dealers") do
      test_dealer = CarDealer.new("Jess' Elite Rides")
      test_dealer.add_dealer()
      expect(CarDealer.all()).to(eq([test_dealer]))
    end
  end






end
