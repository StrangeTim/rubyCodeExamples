require('sinatra')
require('sinatra/reloader')
require('./lib/triangle')
also_reload('lib/**/*.rb')

get ('/') do
  erb(:index)
end

get ('/result') do
  
  @side1 = (params.fetch('side_1')).to_i
  @side2 = (params.fetch('side_2')).to_i
  @side3 = (params.fetch('side_3')).to_i
  test_triangle = Triangle.new(@side1, @side2, @side3)
  @result = test_triangle.triangle_type
  erb(:result)
end
