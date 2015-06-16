require 'pry'

class Address
  @@all_addresses = {}

  define_method(:initialize) do |address|
    @work_addresses = {}
    @home_addresses = {"home1" => address}
    @work_count = 0
    @home_count = 1
  end

  define_singleton_method(:clear) do
    @@all_addresses = {}
  end

  define_singleton_method(:all) do
    @@all_addresses
  end

  define_method(:add_addresses) do
    @@all_addresses.store("work_addresses", self.work_addresses())
    @@all_addresses.store("home_addresses", self.home_addresses())
  end

  attr_reader(:work_addresses, :home_addresses)

  define_method(:new_address) do |type, address|

    if type == "work"
      type += (@work_count + 1).to_s
      @work_count += 1
      @work_addresses.store(type, address)
    end

    if type == "home"
      type += (@home_count + 1).to_s
      @home_count += 1
      @home_addresses.store(type, address)
    end

    self.add_addresses()
  end

end
