require 'rspec'
require 'contact'
require 'address'
require 'pry'

describe(Address) do

  before() do
    Address.clear()
  end

  describe('#address') do
    it("creates an address class variable which stores addresses depending on type") do
      test_address = Address.new("The White House")
      expect(test_address.home_addresses()).to(eq("home1" => "The White House"))
    end
  end

  describe('#address2') do
    it("creates an additional address and stores it properly to all_addresses") do
      test_address = Address.new("The White House")
      test_address.add_addresses()
      test_address.new_address("work","The Whole Damned Country")
      test_address.new_address("home","Leet Riche Pad in the Hamptons")
      expect(Address.all()).to(eq("work_addresses" => {"work1" => "The Whole Damned Country"}, "home_addresses" => {"home1" => "The White House", "home2" => "Leet Riche Pad in the Hamptons"}))
    end
  end
end
