=begin
input: an array of positive integers (argument is valid)
output: a positive integer (average of all numbers in array)
rule:
given array is never empty and contains
only positive integers
average of [1,3,5,2] = (1+3+5+2)/4 = 2 (appro from2.75)
algorithm:
set a variable with value of 0
iterate through the given array,
add each element to the variable and reset the variable
divide the variable by length of array and round up the result (by removing all decimal)
=end

# further-exploration
def aveg(array)
  sum = array.reduce{ |sum, number| sum + number}
  (sum / array.count.to_f).round(2)
end

puts aveg([1,2,3,9])
puts aveg([4,5,6,8])

# another way- using Enumerable#reduce
def ave(array)
  sum = array.reduce{ |sum, number| sum + number}
  sum / array.count
end

puts ave([1,2,3])
puts ave([4,5,6])

# first attempt
def average(array)
  sum = 0
  array.each do |element|
    sum = sum + element
  end
  sum / array.length
end

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40