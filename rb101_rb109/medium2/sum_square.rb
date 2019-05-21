=begin
input: a positive integer
output: an integer (the difference between the square of the sum of the first n positive integers 
  and the sum of the squares of the first n positive integers.)
algorithm:
  - a method for square of sum
  - a method for sum of square
  - a method for the differnece 
=end

# first attempt
def square_of_sum(array_of_num)
  (array_of_num.reduce(:+)) ** 2
end

def sum_of_square(array_of_num)
  sum = 0
  array_of_num.each do |n|
    sum += (n ** 2)
  end
  sum
end

def sum_square_difference(num)
  array = (1..num).to_a
  square_of_sum(array) - sum_of_square(array)
end


# another solution - all in 1 method
=begin
def sum_square_difference(num)
  sum = 0
  sum_of_square = 0
  1.upto(num) do |value|
    sum += value
    sum_of_square += value**2
  end

  sum** 2 - sum_of_square
end
=end

puts sum_square_difference(3)
puts sum_square_difference(10)
puts sum_square_difference(1)
puts sum_square_difference(100)