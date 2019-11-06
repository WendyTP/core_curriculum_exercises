=begin
Enumerable#none?
# none? {block} -> true if no element returns true; otherwise false
# non? {no block} -> true if all elements are falsey
# stops iteration as soon as an element return true
# [].none? (block) -> true

custom#none?
input: an array(can be empty)
output: true/ false
requirment: no all?, any?, none?, one?
   but can use custom#any? and custom#all?
data: array
algorithm:
  - if block_given?
    iterate through arr, yield element to block
    return false if block return value is truthy
    return true if all return values are fasey
  - else
    iterate through arr, return false if any element is truthy
    true
=end

# not using any custom methods
=begin
def none?(arr)
  if block_given?
    arr.each {|element| return false if yield(element)}
    true
  else
    arr.each {|element| return false if element}
    true
  end
=end

# using custom#any?

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

def none?(arr, &block)
  !any?(arr, &block)
end

#p none?([1, 3, 5, 6]) { |value| value.even? }
#p none?([1, 3, 5, 7]) { |value| value.even? }
#p none?([2, 4, 6, 8]) { |value| value.odd? }
#p none?([1, 3, 5, 7]) { |value| value % 5 == 0 }
#p none?([1, 3, 5, 7]) { |value| true} 
#p none?([1, 3, 5, 7]) { |value| false }
#p none?([]) { |value| true }

p none?([])
p none?([1,2,3])
p none?([false, nil])