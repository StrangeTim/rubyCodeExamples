require('rspec')
require('triangle')

describe(Triangle) do
  describe('#equilateral') do
  it('returns true if each side of the triangle is equal') do
    test_equilateral = Triangle.new(2, 2, 2)
    expect(test_equilateral.equilateral).to(eq(true))
  end
  it('returns false if each side of the triangle is not equal') do
    test_equilateral2 = Triangle.new (1, 1, 2)
    expect(test_equilateral2.equilateral).to(eq(false))
  end
  end

  describe('#isosceles') do
  it('returns true if the triangle is isosceles') do
    test_isosceles = Triangle.new(2, 2, 3)
    expect(test_isosceles.isosceles).to(eq(true))
  end
  it('returns false if the triangle is not isosceles') do
    test_isosceles2 = Triangle.new (1, 1, 1) do
    expect(test_isosceles2.isosceles).to(eq(false))
  end
  end

  describe('#scalene') do

  end
  describe('#not_triangle') do

  end
end
