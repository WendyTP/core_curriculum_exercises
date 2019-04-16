=begin
request: Given an unordered array and the information that exactly one value in the array occurs twice 
(every other value occurs exactly once), Write a method that will find and return the duplicate value that is known to be in the array.
input: an array 
output: an integer
rules: assume elements in the given array are integers
data: array
algorithm:
  - set up a counter = 0
  - while the counter is less than the array length
    - comparing_element = array[counter]
    - compare against the rest of array,
      - if one matching lement found
        break the loop
      otherwise, counter += 1
    - return the comparing_element  
=end

def find_dup(arr)
  counter = 0
  while counter < arr.length-1
    comparing_element = arr[counter]
    elements_to_compare = arr[(counter+1)..]
    break if elements_to_compare.include?(comparing_element)
    counter += 1
  end
  comparing_element
end

# another solution
=begin
def find_dup(array)
  array.find {|element| array.count(element) == 2}
end
=end

p find_dup([1,5,3,1])
p find_dup(["a","b","c","a"])
p find_dup([1,5,3,3])

