=begin
input: an integer
output: an integer - doubled integer or the given integer if it's a double number
double num: 1. even numbers of digits ; 2. first-half is the same as second-half
algorithim
   define double numbers 
   return number * 2 or number if it's double number
=end

def double_number?(number)
  string_num = number.to_s
  return false unless string_num.size.even?
  centre_index = (string_num.size)/2
  string_num[0...centre_index] == string_num[centre_index..-1]  
end  


def twice(number)
  return number if double_number?(number)
  number * 2
end  



puts double_number?(37)
puts double_number?(103103)
puts double_number?(101)

puts twice(37)
puts twice(44)
puts twice(334433)
puts twice(444)
puts twice(107)
puts twice(103103)
puts twice(3333)
puts twice(7676)
p twice(123_456_789_123_456_789)
puts twice(5)