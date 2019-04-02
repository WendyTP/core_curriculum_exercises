=begin
input: a positve integer greater than 0
output: return true or false
rules:
  - write a method
  - leap year : 
    year % 400 == 0 or (year % 4 == 0 && year % 100 != 0)
  -assume input year is greater than 0
  - return true if it's leap year; false if not
data: integer
=end

def leap_year?(year)
  year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)
end



def testing(test_examples)
  test_examples.map do |example|
    puts leap_year?(example)
  end  
end

testing([2016,2015,2100,2400,240000,240001])

# further exploration
=begin

def leap_year?(year)
  if year % 100 == 0
    false
  elsif year % 400 == 0
    true
  else
    year % 4 == 0
  end
end

# if we pass the years that are divisable by 400
to the above re-written leap_year? method, the results will
fail (ie. it will return false instead of true).


# if re-write the method in the oppositie order (as below):
def leap(year)
  if year % 4 != 0
    false
  else
    if year % 100 != 0
      true
    else
      if year % 400 == 0
        true
      else
        false
      end
    end
  end
end

# it is possible to re-write this method, however it is more complicated than the original method,
as need to consider both == 0 or != 0 situation for all 3 criteria.

=end

