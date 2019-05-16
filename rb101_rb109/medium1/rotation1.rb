=begin
input: an array of ele
output: return an array of elements from given array, but the first ele will be placed at the last position
rules: given array remains unchaged ; don't use Array#rorate(!)
  
=end

#first attempt
def rotate_array(arr)
  rotated_arr = []
  arr[1..-1].each {|ele| rotated_arr << ele}
  rotated_arr << arr[0]
end

# another solution
=begin
def rotate_array(array)
  array[1..-1] + [array[0]]
end
=end


p rotate_array([7, 3, 5, 2, 9, 1])
p rotate_array(['a', 'b', 'c'])
p rotate_array(['a'])

x = [1, 2, 3, 4]
p rotate_array(x)
puts x == [1, 2, 3, 4]

def rotate_string(str)
  str[1..-1] + str[0]
end

st = "super"
p rotate_string(st)
puts st

def rotate_integer(num)
  rotated_num = num.to_s[1..-1] + num.to_s[0]
  rotated_num.to_i
end

p rotate_integer(103)