require('rspec')
require('scrabble_score')

describe('String#score') do
  it("returns a scrabble score for a letter") do
    expect("a".scrabble()).to(eq(1))
  end
  it("returns a scrabble score for a word") do
    expect("apple".scrabble()).to(eq(9))
  end
  it("returns a scrabble score for a blank string") do
    expect("".scrabble()).to(eq(0))
  end
  it("returns a scrabble score for a capitalized string") do
    expect("APPLE".scrabble()).to(eq(9))
  end
end
