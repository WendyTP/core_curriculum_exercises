=begin
Enumerable#drop_while
# drop_while {block} returns a new array (the first element of which the block returns false/nil,
  and the rest of elements not iterated yet )
# drop_while {no block} -> enumerator
# [].drop_while {|n| n > 0} => 0
# [1,2,3].drop_while {|n| n >0} => []
# [1,2,3].drop_while {|n| false} => [1,2,3]

custom#drop_while
input: an array and a block
output: a new array (elements of which block returns false/nil and the remainder)
data: array
algorithm:
  - if block given
      - set a new array
      - iterate through arg. array, yield element to block
      - if block return value is not true
          - insert current element and rest of elements to new array
          - break
      - return new array
      else
        return an enumerator
=end

def drop_while(arr)
  if block_given?
    result = []
    arr.each_with_index do |element, idx|
      unless yield(element)
        result.concat(arr[idx..-1])
        break
      end
    end

    result
  else
    enum = arr.to_enum(:drop_while)
  end
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? }
p drop_while([1, 3, 5, 6]) { |value| value.even? }
p drop_while([1, 3, 5, 6]) { |value| true }
p drop_while([1, 3, 5, 6]) { |value| false }
p drop_while([1, 3, 5, 6]) { |value| value < 5 }
p drop_while([]) { |value| true }
p drop_while([])