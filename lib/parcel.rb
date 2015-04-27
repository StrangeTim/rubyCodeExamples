require 'pry'

class Parcel
  define_method(:initialize) do |length, width, height, weight|
    @length = length
    @width = width
    @height = height
    @weight = weight
  end

  define_method(:volume) do
    volume = @length * @width * @height
  end

  define_method(:cost) do |distance|
    cost = 0
    vol = self.volume
    cost += vol* 0.01
    cost += @weight * 2
    cost += distance * 0.001    
  end
end
