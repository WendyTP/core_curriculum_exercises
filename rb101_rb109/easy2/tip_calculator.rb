=begin
input: bill amount and tip rate (both in string)
output: display tip amount and total amount of bill
rules:
assume user inputs are valid
input shall transorm to float number
output round up to 2 decimal
Algorithm:
get user input for bill amount
get user input for tip rate (unit: percentage)
convert both user inputs to float number
convert tip rate input into percentage
calculate the tip amount
calculate the total bill amount
display results
=end

puts "What is the bill? "
bill_amount = gets.chomp.to_f
puts "What is the tip percentage?"
tip_rate = gets.chomp.to_f
tip_rate_in_percentage = tip_rate / 100

tip = bill_amount * tip_rate_in_percentage
total_bill = bill_amount + tip

puts "The tips is $#{sprintf("%.2f",tip)}"
puts "The total is $#{sprintf("%.2f",total_bill)}"
