=begin
Enumerable#each_with_object
#each_with_object(obj) {block} -> obj
# each_with_object(obj) {no block} -> enumerator
# [1,2,3].each_with_object("st") {|n,str| n += 1} ==> "st"
# [].each_with_object({}) {|n, hash| puts n} ==> {}

cusotm#each_with_object
input: an array and an object, and a block
output: the final updated object
data: array
algorithm:
  - if block given
      - iterate through given array,
        - yield element and the given object to block
      - return the given object
=end

def each_with_object(arr, obj)
  if block_given?
    arr.each {|element| yield(element, obj)}
    obj
  else
    enum = arr.to_enum(:each_with_object)
  end
end

result = each_with_object([1, 3, 5], []) do |value, list|
  list << value**2
end
p result

result = each_with_object([1, 3, 5], []) do |value, list|
  list << (1..value).to_a
end
p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

result = each_with_object([1, 3, 5], {}) do |value, hash|
  hash[value] = value**2
end
p result == { 1 => 1, 3 => 9, 5 => 25 }

result = each_with_object([], {}) do |value, hash|
  hash[value] = value * 2
end
p result == {}

result = [1,2].each_with_object([])
p result