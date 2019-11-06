=begin
input: an array (can be empty), and a block
output: block return true if expression evaluates to true
        method returns an integer (num of times that block returns true)
       empty array returns 0
requirement: no Array#count or Enum#count
data: array
algorithm:
  counter = 0
  iterate through array, yielding element to block
    - counter += 1 if block return value is truthy
  counter
=end

# first approach
=begin
def count(arr)
  counter = 0
  arr.each do |element|
    counter += 1 if yield(element)
  end
  counter
end
=end

# further explo (not using each, loop, while or until)
def count(array)
  counter = 0
  (array.size).times do |idx|
    counter += 1 if yield(array[idx])
  end
  counter
end

p count([1,2,3,4,5]) { |value| value.odd? }
p count([1,2,3,4,5]) { |value| value % 3 == 1 }
p count([1,2,3,4,5]) { |value| true }
p count([1,2,3,4,5]) { |value| false } 
p count([]) { |value| value.even? }
p count(%w(Four score and seven)) { |value| value.size == 5 } 