=begin
Enumerable#all?
# all? {block} -> true if all elements are truthy; otherwise false
# all?(no block) -> implicit block {|obj| obj} --> true if all
elements are truthy (not false nor nil)
# [].all? --> true
# stop iterating as soon as one element is not truthy

custom#all?
input: an array (can be empty)
output: true or false
requirment: no standard ruby methods
    (all?, any?, none?, or one?.)
data: array
algorithm:
  - if block given?
    iterate through arr, yield element to block
    return false unless return value of block is falsey
    return true if all elements are truthy
  - else
    iterate through arr, 
    return false unless element is falsey
    return true if all are truthy
=end

def all?(arr)
  if block_given?
    arr.each {|element| return false unless yield(element)}
    true
  else
    arr.each {|element| return false unless element}
    true
  end
end


#p all?([1, 3, 5, 6]) { |value| value.odd? }
#p all?([1, 3, 5, 7]) { |value| value.odd? }
#p all?([2, 4, 6, 8]) { |value| value.even? } 
#p all?([1, 3, 5, 7]) { |value| value % 5 == 0 }
#p all?([1, 3, 5, 7]) { |value| true }
#p all?([1, 3, 5, 7]) { |value| false } 
#p all?([1,2,nil]) {|value| true}
#p all?([]) {|value| false}
p all?([1,2])
p all?([])
p all?([nil,1])
p all?([false,2])