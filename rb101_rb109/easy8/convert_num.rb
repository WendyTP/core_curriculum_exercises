=begin
input: a positive integer
output: returns a potive integer, with reversed order
rules: no need to do anything about leading zeros in the return value
=end

# first attempt
def reversed_number(num)
  string_num = num.to_s
  result = []
  string_num.each_char do |char|
    result.unshift(char)
  end
  result.join.to_i
end  


# another solution
=begin
def reversed_number(num)
  string = num.to_s
  reversed_string = string.reverse
  reversed_string.to_i
end
=end

puts reversed_number(12345) == 54321
puts reversed_number(12213) == 31221
puts reversed_number(456) == 654
puts reversed_number(12000) # No leading zeros in return value!
puts reversed_number(12003) == 30021
puts reversed_number(1) == 1