=begin
input: a positive integer(argument is valid)
output: sum of the integer's digits
(ex. 234 => 9)
algorithm:
set an empty array (variable)
divide the integer by 10, (ex 230 => [23,0])
insert the remainder to the set array
contine until the first element == 0
add up all the number in the array
=end

# without loop/ iteration -- using Integer#digits
# ex. 12345.digits => [5,4,3,2,1]
def sum_total(number)
  number.digits.reduce {|sum, n| sum + n}
end

puts sum_total(23) == 5
puts sum_total(496) == 19
puts sum_total(123_456_789) == 45


# with loop 
def sum(number)
  array = []
  loop do
    number, remainder = number.divmod(10)
    array << remainder
    break if number == 0
  end
  array.reduce {|sum,n| sum + n}
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

