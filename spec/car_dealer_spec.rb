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

  describe('#add_car_to_dealer') do
    it("adds cars to a specific dealer") do
      test_dealer = CarDealer.new("Jess' Elite Rides")
      test_dealer.add_dealer()
      test_dealer2 = CarDealer.new("Steve's Eliter Rides")
      test_dealer2.add_dealer()
      test_car = Car.new("Toyota", "Corolla", "1995", "neon green")
      test_car.add()
      test_car2 = Car.new("Toyota", "Corolla", "1996", "neon green")
      test_car2.add()
      test_dealer.add_car_to_dealer(1)
      test_dealer2.add_car_to_dealer(2)
      expect(test_dealer.get_dealer_cars()).to(eq([test_car]))
      expect(test_dealer2.get_dealer_cars()).to(eq([test_car2]))
    end
  end
  describe('#get_cars_by_dealer') do
    it("returns list of cars from dealership name") do
      test_dealer = CarDealer.new("Jess' Elite Rides")
      test_dealer.add_dealer()
      test_car = Car.new("Toyota", "Corolla", "1995", "neon green")
      test_car.add()
      test_car2 = Car.new("Toyota", "Corolla", "1996", "neon green")
      test_car2.add()
      test_dealer.add_car_to_dealer(1)
      test_dealer.add_car_to_dealer(2)
      expect(test_dealer.get_cars_by_dealer).to(eq([["Toyota", "Corolla", "1995", "neon green"], ["Toyota", "Corolla", "1996", "neon green"]]))
    end
  end
end
