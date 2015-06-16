require 'sinatra'
require 'sinatra/reloader'
require './lib/parcel'
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/cost') do
  @length = (params.fetch('length')).to_i
  @width = (params.fetch('width')).to_i
  @height = (params.fetch('height')).to_i
  @weight = (params.fetch('weight')).to_i
  @distance = (params.fetch('distance')).to_i
  test_parcel = Parcel.new(@length, @width, @height, @weight)
  @cost = test_parcel.cost(@distance)
  erb(:cost)
end
