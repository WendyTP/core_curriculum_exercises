=begin
input: 2 arrays containing numbers 
output: return 1 array (contains product of each pair num from the arg. that have same index)
rules: assume arg. contain same num. of elements and assume input is valid

=end


# first attempt
def multiply_list(arr1, arr2)
  product_result = []
  counter = 0
  arr1.each do |num|
    product_result << num * arr2[counter]
    counter += 1
  end
  product_result  
end


=begin

# another soulution using each_with_index
def multiply_list(arr1, arr2)
  product_result = []
  arr1.each_with_index do |num, index|
    product_result << num * arr2[index]
  end
  product_result 
end  


# another solution using Array#zip
def multiply_list(arr1, arr2)
  arr1.zip(arr2).map {|sub_arr| sub_arr.reduce(:*)}          # arr1.zip(arr2) :returns [[3,9],[5,10],[7,11]]

end

=end
p multiply_list([3,5,7],[9,10,11])