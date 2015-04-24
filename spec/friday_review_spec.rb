require ('rspec')
require ('friday_review')

describe('String#friday_review') do
  it("Returns a count of 1 or zero for the presence of a sample string within a test string.") do
    expect("happy".friday_review("happy")).to(eq(1))
  end
  it("Returns the correct count for the number of times a sample string appears within a test string.") do
    expect("happy".friday_review("I am happy, happy")).to(eq(2))
  end
  it("Returns the correct count for the number of times a sample string appears within a test string. Ensuring only invalid characters are removed and strings are not incorrectly split.") do
    expect("happy".friday_review("I am happy, happy happy!happy happ hap happya")).to(eq(4))
  end
end
