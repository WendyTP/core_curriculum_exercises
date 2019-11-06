=begin
Array#zip
# zip(collection) --> return a new nested array (array.size == original array.size)
#[1,2,3].zip({a:1, b:2}) --> [[1,[:a, 1]], [2, [:b, 2]], [3, nil]]
#[1,2].zip([4,5], [6,7]) --> [[1,4,6], [2,5,7]]
#[1,2].zip([4,5,6], [7,8,9]) --> [[1,4,7], [2,4,8]]

custom#zip
input: 2 arrays
output: a new nested array
requirement: input not modified ; not use Array#zip ; assume both input array are the same size
data: array
algorithm:
  - iterate through first array
    - insert current indexed element into an empty array, and from the 2nd array as well
    - the filled empty array is returned to by the block 
    - the return value (array) saved into a bigger outer array
  - the outer array being returned after #map invocation
=end

def zip(arr1, arr2)
  arr1.map do |element|
    [] << element << arr2[arr1.index(element)]
  end
end

p zip([1,2,3], [4,5,6])