require ('rspec')
require ('my_hash')
require ('pry')

describe(My_Hash) do
  describe("#grab") do
    it("retrieves a stored value by its key") do
      test_hash = My_Hash.new(nil, nil)
      test_hash.store("kitten", "cute")   # oops, we tested two specs in one!
      expect(test_hash.grab("kitten")).to(eq("cute"))
    end
  end

  describe("#remove") do
    it("Removes key/value pair based on key from current hash") do
      initial_hash = My_Hash.new("Dog", "Furry")
      initial_hash.store("Cat", "Furry")
      initial_hash.remove("Dog")
      expect(initial_hash.grab("Dog")).to(eq("That key doesn't exist."))
# binding.pry
    end
  end
end
