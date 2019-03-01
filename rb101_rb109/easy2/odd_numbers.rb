=begin
input: range of integers
ouput: range of integers
rule: 
choose only odd numbers
print out each number on separate line
=end
for number in (1..9)
  puts number if number % 2 != 0
end  

(1..9).each {|n| puts n if n.odd?}

1.upto(9) {|n| puts n if n %2 == 1}