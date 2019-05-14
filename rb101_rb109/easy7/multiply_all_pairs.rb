=begin
input: 2 arrays containing numbers
output: 1 sorted array contains product of every pair of numbers that can be formed between the elements of the two Arrays. 
rules: no empty array as input, input is valid  
=end

def multiply_all_pairs(arr1,arr2)
  arr1.product(arr2).map {|sub_arr| sub_arr.inject(:*)}.sort

end

p multiply_all_pairs([2, 4], [4, 3, 1, 2])  #=> [2, 4, 4, 6, 8, 8, 12, 16]
