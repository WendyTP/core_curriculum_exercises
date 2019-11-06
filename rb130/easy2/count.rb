=begin
Enumerable#count
# count --> int ([1,2,4].count => 3)
# count(arg) --> int ([1,2,4].count(2) ==> 1)
# count {block} --> int ([1,2,4].count {|n| n %2 == 0} ==> 2)
#[].count ==> 0 
#[].count(2) ==> 0
#[].count {|n| n ==2} ==> 0

custom#count
input: 0 or multiple arguments and a block
output: an integer >= 0 (times when block return value is truthy)
data: array
algorithm:
  - set a new array which includes all given args
    (if no arg is given, the new array is set to empty)
  - set a counter = 0
  - iterate through the new array, yield one element to block
    - counter += 1 if block return value is truthy
  - return counter
=end

def count(*args)
  arr = args
  counter = 0
  arr.each do |element|
    counter += 1  if yield(element)
  end
  counter
end

p count(1, 3, 6) { |value| value.odd? } 
p count(1, 3, 6) { |value| value.even? }
p count(1, 3, 6) { |value| value > 6 } 
p count(1, 3, 6) { |value| true }
p count() { |value| true }
p count(1, 3, 6) { |value| value - 6 }

