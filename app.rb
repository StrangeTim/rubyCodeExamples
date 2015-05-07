require'sinatra'
require 'sinatra/reloader'
also_reload("lib/**/*.rb")
require './lib/books'
require './lib/authors'
require './lib/patrons'
require 'pg'
require 'pry'

DB = PG.connect({:dbname => "library"})

get("/") do
  erb(:index)
end

get("/books") do
  Book.make_random(12)
  @all_books = Book.all_books
  erb(:books)
end

get("/books/:id") do
  @id = params.fetch('id').to_i
  @all_books = Book.ind_book(@id)
  erb(:books)
end



# ----- FOR USE WHEN INTEGRATING GENRE
# <% elsif %>
#   <ol>
#     <% @all_books.each do |book| %>
#       <li><a href="/books/<%= book.book_id %>"><%= book.book_name %></a></li>
#     <% end %>
#   </ol>
