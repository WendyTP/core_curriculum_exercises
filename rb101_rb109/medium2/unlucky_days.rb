=begin
input: an integer of gregorian year (greater than 1752)
output: return an integer that is the total number of Friday the 13ths of that year
Approach:
  Ruby's Date class may be helpful here.
  Look at how to initialize a Date object
  Look at the friday? method
algorithm:
counter = 0
intiatiate a variable to the 13th of the first month of given year
check if this date is friday
if yes, counter += 1
add one month and to check again
repeat the process until December
return counter
=end

require 'date'

def friday_13th(year)
  thirteen_date = Date.new(year,1,13)
  counter = 0
  1.upto(12) do 
    counter += 1 if thirteen_date.friday?
    thirteen_date = thirteen_date >> 1
  end

  counter

end

puts friday_13th(2015)
puts friday_13th(1986)
puts friday_13th(2019)


# further exploration
=begin
An interesting variation on this problem is to count the number months that have five Fridays. 
This one is harder than it sounds since you must account for leap years.

- 2 counters : one for number months that have 5 Fridays; one for each month whilst adding the week
- check if given year is leap year (if yes : feb has 29 days)
- check for each month (a month) (passing month and corrsponding dates)
- hash of month and corresponding dates 
- iterate through the hash

# my solution
def five_fridays_month?(year, month, dates)
  month_five_counter = 0
  current_date = Date.new(year,month,1)
  1.upto(dates) do 
    month_five_counter += 1 if current_date.friday?
    current_date = current_date.next
  end

  month_five_counter == 5
end

def five_fridays(year)
  dates_in_month = {1 =>  31, 2 => 28, 3 => 31, 4 => 30, 5 => 31, 6 => 30, 7 => 31, 8 => 31, 9 => 30, 10 => 31, 11 => 30, 12 => 31}
  dates_in_month[:feb] = 29 if Date.new(year).leap?
  year_five_fri_counter = 0

  dates_in_month.each do |month, dates|
    year_five_fri_counter += 1 if five_fridays_month?(year, month, dates )
  end

  year_five_fri_counter
end

puts five_fridays(2015)
puts five_fridays(1986)
puts five_fridays(2019)

=end

