require 'rspec'
require 'definition'
require 'pry'

describe(Definition) do

  before() do
    Definition.clear()
  end

  describe('#add_def') do
    it("adds a string to a definitions class variable. verifies proper storage") do
      test_def = Definition.new("completely totally 100% unneccessary")
      test_def.add_def
      expect(Definition.all_defs).to(eq({0 => test_def}))
    end
  end
end
