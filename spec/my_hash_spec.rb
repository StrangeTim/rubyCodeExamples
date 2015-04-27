require ('rspec')
require ('my_hash')

describe(My_Hash) do
  describe("#fetch") do
    it("retrieves a stored value by its key") do
      test_hash = My_Hash.new()
      test_hash.store("kitten", "cute")
      expect(test_hash.fetch("kitten")).to(eq("cute"))
    end
  end
end
