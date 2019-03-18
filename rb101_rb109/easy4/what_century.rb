=begin
input: a positive integer (year)
output: a string that begins with the century number
rules:
  - write a method
  - return value should be a string, and ends with st,nd,rd or th
  - new centuries begin in years end with 01
    (1901- 2000 is 20th century)
  - 1 century comprises 100 years  
example:
  - (1..100) : 1st (century)
  - (101..200): 2nd (century)
  - (201- 300): 3rd (century)
  - (901- 1000): 10th (century)
  - (1001 - 1100): 11th (century)
data: integer 
algorithm:
  - set a variable (century)for quotient reuslt (x/ 100)
  - set a varialbe (remainder) for modulus result (x % 100)
  - if remainder == 0 , century = century
    if remainder != 0, century = century + 1
  - case century_10th_divison_remainder = century % 10
      - when century_10th_divison_remainder == 1, return "century" + "st"
      - when == 2, return "century" + "nd"
      - when ==3, return "century" + "3rd"
      - else , return "century" + "th"
=end

# split the method into two methods

def calculate_century(year)
  century = year / 100
  remainder = year % 100
  century += 1 if remainder != 0
  century.to_s + century_suffix(century)
end

def century_suffix(century)
  return "th" if [11,12,13].include?(century % 100)
  century_10th_divison_remainder = century % 10
  case century_10th_divison_remainder
  when 1 then "st"
  when 2 then "nd"
  when 3 then "rd"
  else "th"
  end
end  





# first attempt
=begin
def calculate_century(year)
  century = year / 100
  remainder = year % 100
  century += 1 if remainder != 0
  return century.to_s + "th" if [11,12,13].include?(century % 100)
  century_10th_divison_remainder = century % 10
  case century_10th_divison_remainder
  when 1 then century.to_s + "st"
  when 2 then century.to_s + "nd"
  when 3 then century.to_s + "rd"
  else century.to_s + "th"
  end
end
=end

puts calculate_century(25)
puts calculate_century(100)
puts calculate_century (1789)
puts calculate_century (2000)
puts calculate_century(1201)
