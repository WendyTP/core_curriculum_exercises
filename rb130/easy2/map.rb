=begin
Enumerable#map
# map {block} --> a new array
# map {no block} --> an enumerator
# {a:1, b:2}.map {|k,v| v +=2} => [3,4] (return a new array instead of a new hash)
# [1,2].map {|n| puts n} => [nil.nil]
# [].map {|n| puts n} => []
# the return value of block is used as new element for the new array

custom#map
input: an array and a block
output: a new aray (contain return value of the block for each element)
requirement: can only use #each, #each_with_object, #each_with_index, #inject, loop, for, while, or until
data: array
algorithm:
  - if block given
      - create a new array
      - iterate through original array, yielding element to block
      - insert block return value to the new array
      - return the new array
=end

def mapp(arr)
  if block_given?
    arr.each_with_object([]) do |element, result|
      result << yield(element)
    end
  else
    enum = arr.to_enum(:map)
  end
end

p mapp([1, 3, 6]) { |value| value**2 } 
p mapp([]) { |value| true }
p mapp(['a', 'b', 'c', 'd']) { |value| false }
p mapp(['a', 'b', 'c', 'd']) { |value| value.upcase }
p mapp([1, 3, 4]) { |value| (1..value).to_a }
p mapp([])
p mapp({a:1, b:2}) {|k,v| v**2}
