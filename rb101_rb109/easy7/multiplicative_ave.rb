=begin
request: Write a method that takes an Array of integers as input, multiplies all the numbers together, 
divides the result by the number of entries in the Array, 
and then prints the result rounded to 3 decimal places. 
rules:
  - Assume the array is non-empty
input: an array of integers
output: an output of string containing a 3-decimal-num
data:array and integer
algorithm
  - call the inject method on the given array, and pass in * as argument --> multiply each element
  - call the to_f method on the returned value --> turn it to a float num
  - divid the float number by number of elements and round the number to 3 decimals
  - assign the returned value to a local variable (multi_ave)
  - call Kernel#format method on the multi_ave, to ensure output is always 3 decimals
  - call the puts method to print out the required string, along with the multi_ave
=end

def show_multiplicative_average(arr)
  multi_ave = (arr.inject(:*).to_f / arr.length).round(3)
  puts "The result is #{format("%0.3f",multi_ave)}"
end

show_multiplicative_average([3, 5])

show_multiplicative_average([6])

show_multiplicative_average([2, 5, 7, 11, 13, 17])