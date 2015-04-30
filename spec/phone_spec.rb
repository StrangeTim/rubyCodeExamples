require 'rspec'
require 'contact'
require 'phone'
require 'pry'

describe(Phone) do

  before() do
    Phone.clear()
  end

  describe('#phone_number') do
    it ("creates an all_numbers class variable which stores numbers depending on type") do
      test_pnumber = Phone.new("6264567896")
      expect(test_pnumber.cell_numbers()).to(eq({"cell1" => "6264567896"}))
    end
  end

  describe('#phone_number2') do
    it ("creates an additional number and stores it properly to all numbers") do
      test_pnumber = Phone.new("6264567896")
      test_pnumber.add_numbers()
      test_pnumber.new_number("cell","2068185442")
      test_pnumber.new_number("work","5028675309")
      test_pnumber.new_number("home","2067794860")
      expect(Phone.all()).to(eq("cell_numbers" => {"cell1"=>"6264567896", "cell2"=>"2068185442"}, "work_numbers" => {"work1"=>"5028675309"}, "home_numbers" => {"home1"=>"2067794860"}))
    end
  end
end
