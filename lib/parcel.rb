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
    @distance = distance
    cost = 0
    vol = self.volume
    cost += vol* 0.01
    cost += @weight * 2
    cost += @distance * 0.001
    cost = cost.to_s.split('.')
    decimal = cost[1]
    if decimal.length() == 1
      decimal += "0"
      cost[1] = decimal
      cost.join('.')
    end
  end
end
