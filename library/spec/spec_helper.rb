require 'rspec'
require './lib/books'
require 'patrons'
require 'authors'
require 'pg'
require 'pry'

DB = PG.connect({:dbname => 'library_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM books *;")
    DB.exec("DELETE FROM authors *;")
    DB.exec("DELETE FROM patrons *;")
    DB.exec("DELETE FROM books_authors *;")
    DB.exec("DELETE FROM patrons_books *;")
    # DB.exec("DELETE FROM copies *;")
  end
end
