=begin
Enumerable#each_cons
# each_cons(n) {block} => nil
# each_cons(n) {no block} => enumerator
# (1..4).each_cons(3) {|a| p a}
  # [1,2,3] , [2,3,4]
  #=> nil
# (1..4).each_cons(4) {|a,b,c,d| p [a,b,c,d]}
  # [1,2,3,4]
  #=> nil
  # (1..4).each_cons(5) {|a| p a} #=> nil
# (1..4).each_cons(5) {|a,b,c,d,e| p [a,b,c,d,e]} #=> nil
# [].each_cons(2) {|a| p a} #=> nil

custom#each_cons
input: an array and a block
output: return nil
requirement: 
  - take 2 elements from given array at a time
  - yied the 2 elements to block
data: array
algorithm:
  - iterate through array,
    - yield current element and next element to block
    - break if next element is the last element of array
  - return nil
  
=end

def each_cons(arr)
  arr.each_with_index do |element, idx|
    break if (idx + 1) >= (arr.size) - 1
    yield(element, arr[idx +1])
  end
  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil