require 'pry'

class Book
  attr_reader(:book_id, :book_name)

  define_method(:initialize) do |variable|
    @book_name = variable.fetch(:name)
    @book_id = variable.fetch(:id)
  end

  define_singleton_method(:all_books) do
    returned_books = DB.exec("SELECT * FROM books;")
    books = []
    returned_books.each() do |book|
      book_name = book.fetch("book_name")
      id = book.fetch("book_id").to_i
      books.push(Book.new(:name => book_name, :id => id))
    end
    books
  end

  define_singleton_method(:ind_book) do |desired_id|
    returned_books = DB.exec("SELECT * FROM books WHERE book_id = '#{desired_id}';")
    books = []
    book_name = returned_books.first().fetch("book_name")
    id = returned_books.first().fetch("book_id").to_i
    books.push(Book.new(:name => book_name, :id => id))
    books
  end

  define_method(:save_book) do
    result = DB.exec("Insert INTO books (book_name) VALUES ('#{@book_name}') RETURNING book_id; ")
    @book_id = result.first().fetch("book_id").to_i()
  end

  define_method(:update_book) do |name, id|
    DB.exec("UPDATE books SET book_name = '#{name}'  WHERE book_id = '#{id}';")
    returned_book = DB.exec("Select * FROM books WHERE book_id = '#{id}';")
    new_name = returned_book.first().fetch("book_name")
    new_id = returned_book.first().fetch("book_id").to_i
    new_book = Book.new({:name => new_name, :id => new_id})
  end

  define_method(:delete_book) do
    DB.exec("DELETE FROM books WHERE book_id = '#{self.book_id}'")
  end

  define_method(:==) do |other_book|
    self.book_name == other_book.book_name && self.book_id == other_book.book_id
  end

  define_singleton_method(:make_random) do |int|
    counter = 0
    books_counter = rand(12)
    books_list = ["The Catcher in the Rye", "20,000 Leagues Under the Sea", "Moby Dick",
      "Foundation and Empire", "I, Robot", "Mistborn", "The Sword of Truth", "Star Wars: A New Hope",
      "Fire Star", "Jupiter Ascending", "Of Mice and Men", "Naruto"]
    until counter == int do
      new_book = Book.new({:name => books_list[books_counter], :id => nil})
      new_book.save_book()
      counter += 1
      books_counter += 1
      if books_counter == 12
        books_counter = 0
      end
    end
  end

    define_method(:get_authors) do

      returned_authors = DB.exec("SELECT author_id FROM books_authors WHERE book_id = '#{self.book_id}';")
      authors = []
      returned_authors.each() do |author|
        author_name = author.author_name
        author_id = author.author_id
        new_author = Author.new(:name => author_name, :id => author_id)
        authors.push(new_author)
      end
      authors
    end

end
