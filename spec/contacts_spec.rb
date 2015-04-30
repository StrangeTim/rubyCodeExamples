require 'rspec'
require 'contact'
require 'phone'
require 'pry'

describe(Contact) do

  before() do
    Contact.clear()
  end

  describe('#contact_list') do
      it("creates a new contact and returns proper values as queried") do
        test_contact = Contact.new({:first_name => "Bob", :last_name => "Saget", :birth_date => "1970/05/15"})
        expect(test_contact.first_name()).to(eq("Bob"))
        expect(test_contact.last_name()).to(eq("Saget"))
        expect(test_contact.birth_date()).to(eq("1970/05/15"))
    end
  end
  describe('#contact_list2') do
    it("creates a new contact and properly stores it to an overall list of contacts") do
      test_contact = Contact.new({:first_name => "Bob", :last_name => "Saget", :birth_date => "1970/05/15"})
      test_contact.add_contact()
      expect(Contact.all()).to(eq({"Bob Saget" => test_contact}))
    end
  end
end
