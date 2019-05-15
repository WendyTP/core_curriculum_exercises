=begin
input: a nested array (each sub array contains a string and an integer)
output: return a new array contains number of each fruits 

=end

# first attempt
def buy_fruit(fruit_arr)
  result = []
  fruit_arr.each do |sub_arr|
    sub_arr[1].times { result << sub_arr[0]}
  end
  result
end  



# another solution
=begin
def buy_fruit(list)
  list.map {|fruit, qty| [fruit] * qty}.flatten
end
=end
p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) 