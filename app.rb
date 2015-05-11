require'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
also_reload("lib/**/*.rb")
require './lib/to_do'
require './lib/list'
require 'pg'
require 'pry'



get("/") do
  @lists = List.all()
  # @lists.each() do |list|
  #   list
  # end
  erb(:index)
end

post('/') do
  new_list_day = params.fetch('weekday')
  new_list_date = params.fetch('date')
  new_list = List.new({:name => new_list_day, :date => new_list_date})
  new_list.save
  @lists = List.all()
  erb(:index)
end

get("/view_list/:id") do
  @id = params.fetch("id").to_i
  list = List.this_list(@id)
  puts list
  @tasks = Task.all
  @weekday = list.name
  @date = list.date
  erb(:view_list)
end

post("/view_list/:id") do
  @tasks = Task.all
  @id = params.fetch("id").to_i
  list = List.this_list(@id)
  description = params.fetch("description")
  new_task = Task.new({:description => description, :list_id => @id})
  new_task.save()
  @weekday = list.name
  @date = list.date
  erb(:view_list)
end
