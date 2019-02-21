=begin
input: 2 arguments- a positve integer ; a boolean
output: integer (0 or amt of bonus)
rule:
boolean values: true and false
the given positive integer is salary
bonus : salary / 2
boolean == true -> bonus
boolean == false -> no bnous
=end

def calculate_bonus(number,boolean)
  boolean ? number/2 : 0  
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000