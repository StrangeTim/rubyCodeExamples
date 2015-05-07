require 'spec_helper'

describe(Author) do
  describe("#author_name") do
    it("returns author name") do
      test_author = Author.new({:name => "William Shakefist", :id => nil})
      expect(test_author.author_name()).to(eq("William Shakefist"))
    end
  end

  describe("#save_author") do
    it("pushes the author name into the database") do
      test_author = Author.new({:name => "William Shakefist", :id => nil})
      test_author.save_author()
      all_authors = Author.all_authors
      expect(all_authors).to(eq([test_author]))
    end
  end

  describe(".all_authors") do
    it("retrieves all entries in from the database table accessed") do
      test_author = Author.new({:name => "William Shakefist", :id => nil})
      test_author.save_author()
      test_author2 = Author.new({:name => "Bobby Shakefist", :id => nil})
      test_author2.save_author()
      all_authors = Author.all_authors
      expect(all_authors).to(eq([test_author,test_author2]))
    end
  end

  describe("#id") do
    it("Checks assigned ID to match serial type and be Fixnum") do
      test_author = Author.new({:name => "William Shakefist", :id => nil})
      test_author.save_author()
      all_authors = Author.all_authors
      expect(all_authors[0].author_id).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#update_author") do
    it("alters the name of the original author") do
      test_author = Author.new({:name => "William Shakefist", :id => nil})
      test_author.save_author()
      old_id = test_author.author_id
      new_author = test_author.update_author("Robert Shakefist", test_author.author_id)
      expect(new_author.author_id).to(eq((test_author.author_id)))
      expect(new_author.author_name).to(eq("Robert Shakefist"))
    end
  end


  describe("#delete_author")  do
    it("deletes a author from the database") do
      test_author = Author.new({:name => "Robert Shakefist", :id => nil})
      test_author.save_author()
      test_author2 = Author.new({:name => "William Shakefist", :id => nil})
      test_author2.save_author()
      test_author.delete_author()
      expect(Author.all_authors).to(eq([test_author2]))
    end
  end

end
