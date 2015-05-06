require 'spec_helper'

describe(Book) do
  describe("#book_name") do
    it("returns book name") do
      test_book = Book.new({:name => "Lordy Lord", :id => nil})
      expect(test_book.book_name()).to(eq("Lordy Lord"))
    end
  end

  describe("#save_book") do
    it("pushes the book name into the database") do
      test_book = Book.new({:name => "Lordy Lord", :id => nil})
      test_book.save_book()
      all_books = Book.all_books
      expect(all_books).to(eq([test_book]))
    end
  end

  describe(".all_books") do
    it("retrieves all entries in from the database table accessed") do
      test_book = Book.new({:name => "Lordy Lord", :id => nil})
      test_book.save_book()
      test_book2 = Book.new({:name => "Lordy of the Rings", :id => nil})
      test_book2.save_book()
      all_books = Book.all_books
      expect(all_books[0]).to(eq(test_book))
      expect(all_books[1]).to(eq(test_book2))
    end
  end
  #
  # describe("#id") do
  #   it() do
  #
  #   end
  # end
  #
  # describe("#update_book") do
  #   it() do
  #
  #   end
  # end
  #
  # describe("#delete_book")  do
  #   it() do
  #   end
  # end
  #
  #
  # describe("#==") do
  #   it() do
  #   end
  # end

end







# define_method(:initialize) do
# define_singleton_method(:all_books) do
# define_singleton_method(:ind_book) do
# define_method(:save_book) do
# define_method(:update_book) do
# define_method(:delete_book) do
# define_method(:==) do
