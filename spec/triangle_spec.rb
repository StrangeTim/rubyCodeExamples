require('rspec')
require('triangle')

describe(Triangle) do
  describe('#equilateral?') do
    it('returns true if each side of the triangle is equal') do
      test_equilateral = Triangle.new(2, 2, 2)
      expect(test_equilateral.equilateral?).to(eq(true))
    end
    it('returns false if each side of the triangle is not equal') do
      test_equilateral2 = Triangle.new(5, 5, 3)
      expect(test_equilateral2.equilateral?).to(eq(false))
    end
  end

  describe('#isosceles?') do
    it('returns true if the triangle is isosceles') do
      test_isosceles = Triangle.new(5, 5, 3)
      expect(test_isosceles.isosceles?).to(eq(true))
    end
    it('returns false if the triangle is not isosceles') do
      test_isosceles2 = Triangle.new(1, 1, 1)
      expect(test_isosceles2.isosceles?).to(eq(false))
    end
  end

  describe('#scalene?') do
    it ('returns true if the triangle is scalene') do
      test_scalene = Triangle.new(13,9,14)
      expect(test_scalene.scalene?).to(eq(true))
    end
    it ('returns false if the triangle is not scalene') do
      test_scalene2 = Triangle.new(5,5,3)
      expect(test_scalene2.scalene?).to(eq(false))
    end
  end

  describe('#not_triangle?') do
    it ('returns true if the given sides would create an invalid triangle') do
      test_not_triangle = Triangle.new(2,1,4)
      expect(test_not_triangle.not_triangle?).to(eq(true))
    end
    it ('returns false if the given sides would create a valid triangle') do
      test_not_triangle2 = Triangle.new(5,5,3)
      expect(test_not_triangle2.not_triangle?).to(eq(false))
    end
  end
end
