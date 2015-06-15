require 'pry'

class Car
  @@cars = []

  define_method(:initialize) do |make, car_model, year, color|
    @make = make
    @model = car_model
    @year = year
    @color = color
    # @id = @@cars.length().+(1)
    if @@cars.length() > 0
      last_id = @@cars[-1].get_id()
      @id = last_id + 1
    else
      @id = 1
    end
  end

  define_singleton_method(:all) do
    @@cars
  end

  define_singleton_method(:get_by_id) do |desired_car|
    car_match = nil
    car_found = false

    @@cars.each() do |car|
      if car.get_id() == desired_car
        car_found = true
        car_match = car
      end
    end
    if car_found == false
      return "No match found"
    else
      return car_match
    end
  end

  define_singleton_method(:get_by_make) do |desired_car|
    matching_cars = []
    @@cars.each() do |car|
      if car.get_make() == desired_car
        matching_cars.push(car)
      end
    end
    matching_cars
  end

  define_singleton_method(:get_by_model) do |desired_car|
    matching_cars = []
    @@cars.each() do |car|
      if car.get_model() == desired_car
        matching_cars.push(car)
      end
    end
    matching_cars
  end

  define_singleton_method(:get_by_year) do |desired_car|
    matching_cars = []
    @@cars.each() do |car|
      if car.get_year() == desired_car
        matching_cars.push(car)
      end
    end
    matching_cars
  end


  define_singleton_method(:clear) do
    @@cars = []
  end

  define_method(:add) do
    @@cars.push(self)
  end

  define_method(:get_make) do
    @make
  end

  define_method(:get_model) do
    @model
  end

  define_method(:get_year) do
    @year
  end

  define_method(:get_color) do
    @color
  end

  define_method(:get_id) do
    @id
  end

  define_singleton_method(:make_inventory) do |number|
    car_make = ["Ford", "Audi", "Volvo", "VW", "Benz", "Subaru", "Toyota"]
    car_model = ["Taurus","Outback", "Elantra", "Miata", "Protege", "Focus", "Escape"]
    colors = ["red", "blue", "green", "yellow", "magenta", "purple", "black"]
    years = ["1990","1991","1992","2000", "1905", "2304", "1200"]
    counter = 0
    counter2 = 0
    until counter == number do
      @@cars.push(Car.new(car_make[counter2], car_model[counter2], years[counter2], colors[counter2]))
      counter += 1
      counter2 += 1
      if counter2 == 7
        counter2 == 0
      end
    end
  end


end
