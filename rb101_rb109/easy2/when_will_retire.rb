=begin
input: user current age ; desire retire age (integer in string form)
output: display of current year ; the year user will retire ; and the total of years to work
rule:
assume user inputs are valid
years need to be yyyy format
output numbers are all positive integer
algorithm:
ask user for input of age
ask user for input of age to retire
convert both inputs from string to integer
calculate year of retirement and save in a variable
caluclate years of working left and save in a varialbe
display results
=end

puts "What is your age?"
user_age = gets.chomp.to_i

puts "At what age would you like to retire?"
retire_age = gets.chomp.to_i

current_year = Time.now.year

years_to_retirement = retire_age - user_age
retirement_year = current_year + years_to_retirement

puts "It's #{current_year}. You will retire in #{retirement_year}."
puts "You have only #{years_to_retirement} years of work to go!"