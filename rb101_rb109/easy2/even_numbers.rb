number = 2
while number <= 9
  puts number
  number += 2
end


1.upto(9) {|n| puts n if n.even?}