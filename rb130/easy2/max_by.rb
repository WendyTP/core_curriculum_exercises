=begin
Enumerable#p max_by
# p max_by {block} => the element that has maximum value from block
# p max_by {no block} => an enumerator
# [1,2].p max_by {|n| n} ==> 2
# [1,2].p max_by {|n| true} ==> 1
# ["a", "b"].p max_by {|n| false} ==> "a"
# [].p max_by {|n| n} ==> nil

custom#p max_by
input: an array and a block
output: an element of given array that contains the largest value
data: array
algorithm:
  - if block given
      - max_element = array[0]
      - max_return_value = yield(max_element)
      - iterate through rest of array, yield element to block
        - if return of block is > current max_return_value
            - max_return_value = new return
            - max_element = current element
      - return max_element
=end

def max_by(arr)
  if block_given?
    return nil if arr.size == 0
    max_element = arr[0]
    max_return = yield(max_element)
    arr[1..-1].each do |element|
      result = yield(element)
      if result > max_return
        max_element = element
        max_return = result
      end
    end
    max_element
  else
    enum = arr.to_enum(:max_by)
  end
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil
p max_by([])