require 'pry'

class Car
  @@cars = []

  define_method(:initialize) do |make, car_model, year, color|
    @make = make
    @model = car_model
    @year = year
    @color = color
    @id = @@cars.length().+(1)
    # if @@cars.length() > 0
    #   last_id = @@cars[-1].get_id()
    #   @id = last_id + 1
    # else
    #   @id = 1
    # end
  end

  define_singleton_method(:all) do
    @@cars
  end

  define_singleton_method(:get_by_id) do |desired_car|

    @@cars.each() do |car|
      if car.get_id() == desired_car
        return car
      else
        "No match found"
      end
    end
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

end
