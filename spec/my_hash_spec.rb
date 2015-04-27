require ('rspec')
require ('my_hash')

describe(My_Hash) do
  describe("#grab") do
    it("retrieves a stored value by its key") do
      test_hash = My_Hash.new(nil, nil)
      test_hash.store("kitten", "cute")
      expect(test_hash.grab("kitten")).to(eq("cute"))
    end
  end
end
