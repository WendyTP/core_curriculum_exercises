# assume given argument is a valid integer value
=begin

def is_odd?(number)
  absolute_value = number.abs
  absolute_value % 2 != 0
end
=end


def is_odd?(number)
  number.remainder(2) != 0
end

puts is_odd?(0)
puts is_odd?(-4)
puts is_odd?(-3)
puts is_odd?(4)
puts is_odd?(3)

