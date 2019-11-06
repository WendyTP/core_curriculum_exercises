=begin
Enumerable#one?
# one? {block} -> return true if only one block return value is truthy; otherwise false
# one? {no block} -> retrun true if only one element is truthy
# [].one? => false
# stops iteration if there are 2nd truthy (return) value

custom#one?
input: an array (can be empty)
output: true/ false
requirment: no standard ruby methods
 ( all?, any?, none?, or one?)
data: array
algorithm:
  - if block_given?
    counter = 0
    iterate through array, yielding ele to block
      counter += 1 if block return value is truthy
      return false if counter > 1
    return true
  - else
    counter = 0
    iterate through array, 
      counter += 1 if element is truthy
      return faluse if counter > 1
    return true
=end

def one?(arr)
  
  counter = 0
  if block_given?
    arr.each do |element|
      counter += 1 if yield(element)
      return false if counter > 1
    end
  else
    arr.each do |element|
      counter += 1 if element
      return false if counter > 1
    end
  end
  counter == 1 ? true : false
end


#p one?([1, 3, 5, 6]) { |value| value.even? }
#p one?([1, 3, 5, 7]) { |value| value.odd? } 
#p one?([2, 4, 6, 8]) { |value| value.even? }   
#p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } 
#p one?([1, 3, 5, 7]) { |value| true }  
#p one?([1, 3, 5, 7]) { |value| false }   
#p one?([]) { |value| true } 

p one?([1,2])
p one?([nil, 1])
p one?([false, nil])