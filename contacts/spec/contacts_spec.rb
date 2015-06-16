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

  describe('#add_phone') do
    it("adds a phone class to an exiting contact properly") do
      test_contact = Contact.new({:first_name => "Bob", :last_name => "Saget", :birth_date => "1970/05/15"})
      test_contact.add_contact()
      test_pnumber = Phone.new("6264567896")
      test_pnumber.add_numbers()
      test_pnumber.new_number("cell","2068185442")
      test_pnumber.new_number("work","5028675309")
      test_pnumber.new_number("home","2067794860")
      just_pnumbers = Phone.all()
      test_contact.add_phone(just_pnumbers)
      expect(Contact.all()).to(eq({"Bob Saget" => test_contact}))
      test_contact = (Contact.all()).fetch("Bob Saget")
      expect(test_contact.phone()).to(eq("cell_numbers" => {"cell1"=>"6264567896", "cell2"=>"2068185442"}, "work_numbers" => {"work1"=>"5028675309"}, "home_numbers" => {"home1"=>"2067794860"}))
    end
  end

  describe('#add_email') do
    it("adds a email class to an exiting contact properly") do
      test_contact = Contact.new({:first_name => "Bob", :last_name => "Saget", :birth_date => "1970/05/15"})
      test_contact.add_contact()
      test_pnumber = Phone.new("6264567896")
      test_eaddress = Email.new("bobsaget@afhm.com")
      test_eaddress.add_emails()
      test_pnumber.add_numbers()
      test_pnumber.new_number("cell","2068185442")
      test_pnumber.new_number("work","5028675309")
      test_pnumber.new_number("home","2067794860")
      test_eaddress.new_email("work","bobs@gmail.com")
      test_eaddress.new_email("home","bobbys@gmail.com")
      test_eaddress.new_email("school","robert@gmail.com")
      just_pnumbers = Phone.all()
      just_eaddress = Email.all()
      test_contact.add_phone(just_pnumbers)
      test_contact.add_email(just_eaddress)
      expect(Contact.all()).to(eq({"Bob Saget" => test_contact}))
      test_contact = (Contact.all()).fetch("Bob Saget")
      expect(test_contact.email()).to(eq("work_emails" => {"work1" => "bobsaget@afhm.com", "work2" => "bobs@gmail.com"}, "home_emails" => {"home1" => "bobbys@gmail.com"}, "school_emails" => {"school1" => "robert@gmail.com"}))
    end
  end

  describe('#add_address') do
    it("adds a address class to an exiting contact properly") do
      test_contact = Contact.new({:first_name => "Bob", :last_name => "Saget", :birth_date => "1970/05/15"})
      test_contact.add_contact()
      test_pnumber = Phone.new("6264567896")
      test_eaddress = Email.new("bobsaget@afhm.com")
      test_address = Address.new("The White House")
      test_eaddress.add_emails()
      test_pnumber.add_numbers()
      test_address.add_addresses()
      test_pnumber.new_number("cell","2068185442")
      test_pnumber.new_number("work","5028675309")
      test_pnumber.new_number("home","2067794860")
      test_eaddress.new_email("work","bobs@gmail.com")
      test_eaddress.new_email("home","bobbys@gmail.com")
      test_eaddress.new_email("school","robert@gmail.com")
      test_address.new_address("work","The Whole Damned Country")
      test_address.new_address("home","Leet Riche Pad in the Hamptons")
      just_pnumbers = Phone.all()
      just_eaddress = Email.all()
      just_addresses = Address.all()
      test_contact.add_phone(just_pnumbers)
      test_contact.add_email(just_eaddress)
      test_contact.add_address(just_addresses)
      expect(Contact.all()).to(eq({"Bob Saget" => test_contact}))
      test_contact = (Contact.all()).fetch("Bob Saget")
      expect(Address.all()).to(eq("work_addresses" => {"work1" => "The Whole Damned Country"}, "home_addresses" => {"home1" => "The White House", "home2" => "Leet Riche Pad in the Hamptons"}))
    end
  end


end
