require('rspec')
require('car_desc')

describe(Car) do
  describe('#add') do
    it("adds a car to the class array") do
      test_car = Car.new("Toyota", "Corolla", "1995", "neon green")
      expect(test_car.add()).to(eq([test_car]))
    end
  end
end
