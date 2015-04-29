require('rspec')
require('car_desc')

describe(Car) do

  before() do
    Car.clear
  end

  describe('#add') do
    it("adds a car to the class array") do
      test_car = Car.new("Toyota", "Corolla", "1995", "neon green")
      expect(test_car.add()).to(eq([test_car]))
    end
  end

  describe('.get_by_id') do
    it('checks to ensure proper id incrementation') do
      test_car = Car.new("Toyota", "Corolla", "1995", "neon green")
      test_car.add()
      test_car2 = Car.new("Toyota", "Corolla", "1996", "neon green")
      test_car2.add()
      expect(Car.get_by_id(1)).to(eq(test_car))
    end
  end

  
end
