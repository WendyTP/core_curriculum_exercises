=begin
input: a positive integer (> 0)
output: return true for leap year; false for opposite
rules:
  - yr 1 to 1752 : leap year => yr % 4 == 0
  - yr 1753 to future => current rule (Gregorian calendar) for leap year
data: integer
=end

def leap_year?(year)
  if (1..1752).include?(year)
    year % 4 == 0
  else  
    year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)
  end  
end

def testing(test_examples)
  test_examples.each do |example|
    puts leap_year?(example)
  end
end

testing([400,100,1,1700,1752,1900,2000])