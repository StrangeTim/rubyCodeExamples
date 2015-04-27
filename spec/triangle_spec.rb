require('rspec')
require('triangle')

describe(Triangle) do
  describe('#equilateral') do
  it('tests to see if each side of the triangle is equal') do
    test_equilateral = Triangle.new(2, 2, 2)
    expect(test_equilateral.equilateral).to(eq(true))

  end
  end
  describe('#isosceles') do

  end
  describe('#scalene') do

  end
  describe('#not_triangle') do

  end
end
