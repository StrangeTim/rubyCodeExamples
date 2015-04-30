require 'pry'

class Phone
  @@all_numbers = {}

  define_method(:initialize) do |number|
    @cell_numbers = {"cell1" => number}
# binding.pry
    @work_numbers = {}
    @home_numbers = {}
    @cell_count = 1
    @work_count = 0
    @home_count = 0
  end

  define_singleton_method(:clear) do
    @@all_numbers = {}
  end

  define_singleton_method(:all) do
    @@all_numbers
  end

  define_method(:add_numbers) do
    @@all_numbers.store("cell_numbers", self.cell_numbers())
    @@all_numbers.store("work_numbers", self.work_numbers())
    @@all_numbers.store("home_numbers", self.home_numbers())
  end

  attr_reader(:cell_numbers, :work_numbers, :home_numbers)

  define_method(:new_number) do |type, number|

    if type == "cell"
      type += (@cell_count + 1).to_s
      @cell_count += 1
      @cell_numbers.store(type, number)
    end

    if type == "home"
      type += (@home_count + 1).to_s
      @home_count += 1
      @home_numbers.store(type, number)
    end

    if type == "work"
      type += (@work_count + 1).to_s
      @work_count += 1
      @work_numbers.store(type, number)
    end
    self.add_numbers()
  end


end
