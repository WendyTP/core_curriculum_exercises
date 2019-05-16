=begin
input: an integer
outputL an integer, which is the result of maximum rotation
rules: use rotate_rightmost_digits method
=end

def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end



def max_rotation(number)
  length_of_digits = number.to_s.size
  counter = length_of_digits

  loop do 
    number = rotate_rightmost_digits(number,counter)
    counter -=1
    break if counter  <= 1
  end
  number
end  



puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15 # the leading zero gets dropped
puts max_rotation(8_703_529_146) == 7_321_609_845