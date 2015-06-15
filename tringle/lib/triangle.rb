class Triangle
  define_method(:initialize) do |side1, side2, side3|
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  define_method(:equilateral?) do
    if @side1 == @side2 && @side2 == @side3
      true
    else
      false
    end
  end

  define_method(:isosceles?) do
    if @side1 == @side2 && @side3 == @side2
      false
    elsif @side1 == @side2 || @side2 == @side3 || @side3 == @side1
      true
    else
      false
    end
  end

  define_method(:scalene?) do
    if @side1 != @side2 && @side1 != @side3 && @side2 != @side3
      true
    else
      false
    end
  end

  define_method(:not_triangle?) do
    if ((@side1 + @side2) < @side3) || ((@side1 + @side3) < @side2) || ((@side3 + @side2) < @side1)
       true
     else
       false
     end
   end

   define_method(:triangle_type) do
     if @side1 > 0 &&   @side2 > 0 && @side3 > 0
       if self.equilateral?
         "Your triangle is equilateral"
       elsif self.isosceles?
         "Your triangle is isosceles"
       elsif self.not_triangle?
         "Those sides cannot make a triangle"
       elsif self.scalene?
         "Your triangle has uneven sides and is scalene"
       else
       end
    else "WHAT EVEN IS THIS"
    end
  end
end
