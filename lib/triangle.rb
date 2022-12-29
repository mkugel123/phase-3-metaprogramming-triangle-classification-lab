require 'pry'

class Triangle
  attr_reader :sides

  def initialize(one, two, three)
    @sides = []
    @sides.push(one, two, three)
  end

  def kind
    is_valid_triangle = true
    
    self.sides.each do |num|
      if num >= self.sides.sum - num
        is_valid_triangle = false
      end
    end
    
    if self.sides.include?(0)
      is_valid_triangle = false
    end

    self.sides.each do |num|
      if num.negative?
        is_valid_triangle = false
      end
    end

    if is_valid_triangle
      if self.sides.uniq.count == 1
        :equilateral
      elsif self.sides.uniq.count == 2
        :isosceles
      elsif self.sides.uniq.count == 3
        :scalene
      end
    else
      raise TriangleError
    end
  end

  class TriangleError < StandardError
    # triangle error code
  end
end
