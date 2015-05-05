require'sinatra'
require 'sinatra/reloader'
also_reload("lib/**/*.rb")
require './lib/to_do'
require './lib/list'
require 'pg'
require 'pry'

DB = PG.connect({:dbname => "to_do"})

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
  new_list = List.new({:name => new_list_day, :date => new_list_date, :id => nil})
  new_list.save
  @lists = List.all()
  erb(:index)
end

get("/view_list/:id") do
  @id = params.fetch("id").to_i
  @this_list = List.this_list(@id)
  @tasks = To_Do.list_tasks(@id)
  @weekday = @this_list.name
  @date = @this_list.date
  erb(:view_list)
end

post("/view_list/:id") do
  @id = params.fetch("id").to_i
  description = params.fetch("description")
  @this_list = List.this_list(@id)
  @new_task = To_Do.new({:list_id => @id, :task => description})
  @new_task.add()
  @tasks = To_Do.list_tasks(@id)
  @weekday = @this_list.name
  @date = @this_list.date
  erb(:view_list)
end
