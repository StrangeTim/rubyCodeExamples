require 'spec_helper'

describe(Book) do
  describe("#book_name") do
    it("returns book name") do
      test_book = Book.new({:name => "Lordy Lord", :id => nil})
      expect(test_book.book_name()).to(eq("Lordy Lord"))
    end
  end

  # describe("#save") do
  #   it() do
  #
  #   end
  # end
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
