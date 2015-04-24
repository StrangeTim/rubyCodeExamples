require ('pry')

class String
  define_method(:friday_review) do |target|
    count = 0
    if self == target
      count += 1
    end
    count
  end
end
