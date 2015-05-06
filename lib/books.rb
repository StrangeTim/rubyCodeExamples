class Book
  attr_reader(:book_id, :book_name)

  define_method(:initialize) do |variable|
    @book_name = variable.fetch(:name)
    @book_id = variable.fetch(:id)
  end

  define_singleton_method(:all_books) do

  end

  define_singleton_method(:ind_book) do

  end

  define_method(:save_book) do

  end

  define_method(:update_book) do

  end

  define_method(:delete_book) do

  end

  define_method(:==) do

  end

end
