require 'sinatra'
require 'sinatra/reloader'
require './lib/playlist'
also_reload("lib/**/*.rb")

@all_cds = []

get('/') do
  @all_cds = CD.all()
  erb(:index)
end

post('/') do
  @next_cd = CD.new(params.fetch('new_cd'))
  @next_cd.add_cd()
  @all_cds = CD.title_alpha()
  erb(:index)
end

post('/reset') do
  CD.clear()
  erb(:reset)
end
