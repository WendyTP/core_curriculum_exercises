=begin
Enumerable#any
# any?{block} -> true if at least one of elements is truthy; otherwise false
# any?(no block) -> implicit block {|obj| obj} -> true if 
  at least one of the elements is not false or nil
# [].any? {block or no block}-> false
# called by any collection that has `#each` method defined 
# stops iterate as soon as one element returns true

custom #any
input: an array (can be empty) and a block
output: return true or false  (empty array returns false)
requirement: no standard method `all?`, `any?`, `none?`, `one?`
data: array
algorithm:
   - return false if given array is empty
   - if block_given?
      - yield to block and pass one element to it
      - stop iterating if return value of block is truthy
      - return ture
      - return false if no element is truthy

   - else (block not given)
      - iterate through collection, return true as soon as one element is not false/nil
=end

def any?(arr)
  if block_given?
    arr.each do |element|
      result = yield(element)
      return true if !!result == true
    end
    return false

  else
    arr.each do |element|
      return true if !!element == true
    end
    return false
  end
end

#p any?([1, 3, 5, 6]) { |value| value.even? } 
#p any?([1, 3, 5, 7]) { |value| value.even? } 
#p any?([2, 4, 6, 8]) { |value| value.odd? } 
#p any?([1, 3, 5, 7]) { |value| true }
#p any?([nil,1,nil])
#p any?([]) { |value| true }
