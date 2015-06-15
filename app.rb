require("sinatra")
require("sinatra/reloader")
require("./lib/car_dealer")
require("./lib/car_desc")
also_reload("lib/**/*.rb")

Car.make_inventory(7)
test_dealer = CarDealer.new("Jess' Elite Rides")
test_dealer.add_dealer()
test_dealer2 = CarDealer.new("Steve's Eliter Rides")
test_dealer2.add_dealer()
test_dealer.add_car_to_dealer(1)
test_dealer2.add_car_to_dealer(2)
test_dealer.add_car_to_dealer(3)
test_dealer2.add_car_to_dealer(4)
test_dealer.add_car_to_dealer(5)
test_dealer2.add_car_to_dealer(6)
test_dealer.add_car_to_dealer(7)


get('/') do
  erb(:index)
  end

get('/final') do
   @dealer_id = params.fetch('dealerships')
   dealer = CarDealer.get_by_id(@dealer_id.to_i)
   @dealer_cars = dealer.get_cars_by_dealer()
   erb(:final)
end
