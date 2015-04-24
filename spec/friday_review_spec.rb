require ('rspec')
require ('friday_review')

describe('String#friday_review') do
  it("Returns a count of 1 or zero for the presence of a sample string within a test string.") do
    expect("happy".friday_review("happy")).to(eq(1))
  end
end
