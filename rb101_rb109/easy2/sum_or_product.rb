=begin
input: an integer (in string form) ; a string character of eithe "s" or "p"
ouput: op1: display the result of summing numbers from 1 to user input
op2: display the result of product from 1 to user input
rule: 
need to check user input validity
user input is a positve integer (> 0)
computation starts from 1 til user given number (inclusive)
algorithm:
create method of sum computation
create method of product computation
create method of validate user number input
create method of validate user choice input
get user input of number
validate user input
convert user input from string to integer
get user input of "s" or "p"
convert user input  to lowercase
validate user input
if user input == "s"
  display the sum result
elsif user input == "p"
  display the product result
ask user if for continue the game      
=end

def valid_positive_integer?(number)
  (/^\d+$/.match(number)) && (number.to_i > 0)
end


def valid_number
  input_number = nil
  loop do
    puts "Please enter an integer greater than 0:"
    input_number = gets.chomp
    break if valid_positive_integer?(input_number)
    puts "The number given is not valid."
  end
input_number  
end

def valid_choice
  user_choice = nil
  loop do
    puts "Enter 's' to compute the sum, 'p' to compute the product."
    user_choice = gets.chomp.downcase
    break if user_choice == "s" || user_choice == "p"
    puts "The choice is not valid."
  end
  user_choice
end

def compute_sum(number)
  total = 0
  1.upto(number) {|n| total += n}
  total
end

def compute_product(number)
  total = (1..number).inject(:*)
  total
end

loop do
  number = valid_number.to_i
  choice = valid_choice

  if choice == "s"
    sum = compute_sum(number)
    puts "The sum of the integers between 1 and #{number} is #{sum}"

  elsif choice == "p"
    product = compute_product(number)
    puts "The product of the integers between 1 and #{number} is #{product}"      
  end    

  puts "Would you like to play again? (enter 'y' to continue)"
  continue = gets.chomp.downcase
  break unless continue.start_with?("y")
end 
puts "goodbye!"