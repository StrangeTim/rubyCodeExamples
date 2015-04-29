class CarDealer
  @@dealers = []

  define_singleton_method(:clear) do
    @@dealers = []
  end

  define_singleton_method(:all) do
    @@dealers
  end

  define_method(:initialize) do |dealership_name|
    @dealership = dealership_name
    @dealership_id = @@dealers.length().+(1)
    @dealer_cars = []
  end

  define_method(:add_dealer) do
    @@dealers.push(self)
  end

  define_method(:add_car_to_dealer) do |car_id|
    @dealer_cars.push(Car.get_by_id(car_id))
  end

  define_method(:sell_car) do |car_id|
    @dealer_cars.each() do |car|
      if car.get_id() == car_id
        @dealer_cars.delete(car)
      end
    end
  end



end
