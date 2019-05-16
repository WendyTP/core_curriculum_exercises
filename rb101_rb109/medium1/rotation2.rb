=begin
input: 2 integer arg.
output: 1 integer, with last n digits rotated
rules: return original number if only last 1 digit to be rotated;
use rotate_array method 
assume n is always positive

=end

def rotate_array(array)
  array[1..-1] + [array[0]]
end


# first attempt
def rotate_rightmost_digits(num, count)
  num_array = num.to_s.chars
  unchanged_digits = num_array[0,(num_array.size)-count]
  rotating_digits = num_array- unchanged_digits
  rotated_digits = rotate_array(rotating_digits)
  (unchanged_digits + rotated_digits).join.to_i
end


# another solution
=begin
def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end  
=end

puts rotate_rightmost_digits(735291, 1) == 735291
puts rotate_rightmost_digits(735291, 2) == 735219
puts rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4)
puts rotate_rightmost_digits(735291, 5) == 752913
puts rotate_rightmost_digits(735291, 6) == 352917