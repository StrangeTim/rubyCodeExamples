require 'pry'

class Author
  attr_reader(:author_id, :author_name)

  define_method(:initialize) do |variable|
    @author_name = variable.fetch(:name)
    @author_id = variable.fetch(:id)
  end

  define_singleton_method(:all_authors) do
    returned_authors = DB.exec("SELECT * FROM authors;")
    authors = []
    returned_authors.each() do |author|
      author_name = author.fetch("author_name")
      id = author.fetch("author_id").to_i
      authors.push(Author.new(:name => author_name, :id => id))
    end
    authors
  end

  define_singleton_method(:ind_author) do |desired_id|
    returned_authors = DB.exec("SELECT * FROM authors WHERE author_id = '#{desired_id}';")
    authors = []
    author_name = returned_authors.first().fetch("author_name")
    id = returned_authors.first().fetch("author_id").to_i
    authors.push(Author.new(:name => author_name, :id => id))
    authors
  end

  define_method(:save_author) do
    result = DB.exec("Insert INTO authors (author_name) VALUES ('#{@author_name}') RETURNING author_id; ")
    @author_id = result.first().fetch("author_id").to_i()
  end

  define_method(:update_author) do |name, id|
    DB.exec("UPDATE authors SET author_name = '#{name}'  WHERE author_id = '#{id}';")
    returned_author = DB.exec("Select * FROM authors WHERE author_id = '#{id}';")
    new_name = returned_author.first().fetch("author_name")
    new_id = returned_author.first().fetch("author_id").to_i
    new_author = Author.new({:name => new_name, :id => new_id})
  end

  define_method(:delete_author) do
    DB.exec("DELETE FROM authors WHERE author_id = '#{self.author_id}'")
  end

  define_method(:==) do |other_author|
    self.author_name == other_author.author_name && self.author_id == other_author.author_id
  end

  define_singleton_method(:make_random) do |int|
    counter = 0
    authors_counter = rand(12)
    authors_list = ["William Shakefist", "Doc Brown", "Captain Kirk", "Nancy Houghs", "Neil Gaiman",
       "Phillip Kay", "Tom Robbins", "Brandon Sanderson", "Robert Jordan", "Isaac Asimov", "Ben Bova", "Phillip Bougouis"]
      until counter == int do
        new_author = Author.new({:name => authors_list[authors_counter], :id => nil})
        new_author.save_author()
        counter += 1
        authors_counter += 1
        if authors_counter == 12
          authors_counter = 0
        end
      end
    end


  end
