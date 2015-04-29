class Car
  @@cars = []

  define_method(:initialize) do |make, car_model, year, color|
    @make = make
    @model = car_model
    @year = year
    @color = color
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
end
