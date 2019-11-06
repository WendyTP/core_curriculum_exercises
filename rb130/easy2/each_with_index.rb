=begin
Enumerable#each_with_index
# each_with_index(*args) {block} => calling obj
# each_with_index(*args) {no block} => enumerator
# [1,2].each_with_index {|ele, idx| true } ==> [1,2]
# [].each_with_index {|n, idx| p n} => []
custom# each_with_index
input: an array and a block
output: the caller array
data: array
algorithm:
  - if block given
      - iterate through given array,
        - yield current element and its index to block
      - return given array
=end

def each_with_index(arr)
  if block_given?
    arr.each do |element|
      yield(element, arr.index(element))
    end
  else
    enum = arr.to_enum(:each_with_index)
  end
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

p result

res = each_with_index([])
p res

re = each_with_index([]) {|n, idx| puts idx}
p re