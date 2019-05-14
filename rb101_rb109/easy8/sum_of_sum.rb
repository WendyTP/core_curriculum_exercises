=begin
input: an array of numbers
output: return an integer (the sum of the sum of each leading sub. for the array)
rules: assume the given array contains at least 1 number, and the input is valid
=end

# first attempt

def sum_of_sums(arr)
  sum_array = []
  arr.each_with_index do |_, index|
    sum_array << arr[0..index].inject(:+)
  end
  sum_array.inject(:+)
end


# another solution with .upto method
=begin
def sum_of_sums(arr)
  sum_total = 0
  1.upto(arr.size) do |count|
    sum_total += arr[0,count].reduce(:+)
  end
  sum_total
end
=end   

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35