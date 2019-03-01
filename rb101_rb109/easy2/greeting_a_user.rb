=begin
input: user name (in string form)
output: op1 - display a string with user name included
op2 - display a all uppercase string with user name included
rule:
assume user input is valid 
if user give their name => op1
if user give their name+! => op2
Algorithm:
get user input (in string)
if user input includes "!" at the end, 
  display a message with all uppercase, including user name (without "!")
otherwise
  display a message with user name  
=end

# use regex & slice method
puts "What is your name?"
user_name = gets.chomp

if user_name.match(/!$/)
  puts "Hello #{user_name.slice(0..-2)}. Why are we screaming?".upcase
else
  puts "Hello #{user_name}"  
end  

# use end_with? method & chop method
puts "What is your name?"
user_name = gets.chomp

if user_name.end_with?("!")
  puts "Hello #{user_name.chop}. Why are we screaming?".upcase
else
  puts "Hello #{user_name}"  
end  

