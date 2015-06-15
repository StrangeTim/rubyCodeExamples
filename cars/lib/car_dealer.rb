class CarDealer
  @@dealers = []

  define_method(:initialize) do |dealership_name|
    @dealership_name = dealership_name
    @dealership_id = @@dealers.length().+(1)
    @dealer_cars = []
  end

  define_singleton_method(:clear) do
    @@dealers = []
  end

  define_singleton_method(:all) do
    @@dealers
  end

  define_method(:get_name) do
    @dealership_name
  end

  define_method(:get_id) do
    @dealership_id
  end

  define_singleton_method(:get_by_id) do |number|
    @@dealers.each() do |dealer|
      if dealer.get_id() == number
        return dealer
      end
    end
  end

  define_singleton_method(:dealer_exists) do |name|
    dealer_exists = nil
    @@dealers.each() do |dealer|
      if dealer.get_name().downcase == name.downcase
        dealer_exists = dealer
      end
    end
    dealer_exists
  end


  define_method(:get_cars_by_dealer) do
    cars = [ ]
    result = [ ]
    cars = self.get_dealer_cars()
    cars.each() do |car|
      car_array = [car.get_make(), car.get_model(),
                  car.get_year(), car.get_color()]
      result.push(car_array)
    end
      result
  end

  define_method(:add_dealer) do
    @@dealers.push(self)
  end

  define_method(:add_car_to_dealer) do |car_id|
    @dealer_cars.push(Car.get_by_id(car_id))
  end

  define_method(:get_dealer_cars) do
    @dealer_cars
  end

  define_method(:sell_car) do |car_id|
    @dealer_cars.each() do |car|
      if car.get_id() == car_id
        @dealer_cars.delete(car)
      end
    end
  end



end
