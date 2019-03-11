=begin
input: two positive integers
output: operation and result of addition, subtraction,
  product, quotient, remainder and power (in string form)
rules: 
  - assume user inputs are valid positive integer and not 0
  - output are positve integers
data: integer
algorithm:
  - request user input for two integers
  - set variables for the user input
  - perform the operations 
  - print out the operation process and result
=end

def prompt(message)
  puts "==> #{message}"
end

def addition(num1, num2)
  num1 + num2
end

def subtraction(num1, num2)
  num1 - num2
end

def product(num1, num2)
  num1 * num2
end

def quotient(num1, num2)
  num1 / num2
end

def remainder(num1, num2)
  num1 % num2
end

def power(num1, num2)
  num1 ** num2
end

prompt("Enter the first number:")
first_number = gets.chomp.to_f

prompt("Enter the second number:")
second_number = gets.chomp.to_f

prompt("#{first_number} + #{second_number} = #{addition(first_number,second_number)}")
prompt("#{first_number} - #{second_number} = #{subtraction(first_number,second_number)}")
prompt("#{first_number} * #{second_number} = #{product(first_number,second_number)}")
prompt("#{first_number} / #{second_number} = #{quotient(first_number,second_number)}")
prompt("#{first_number} % #{second_number} = #{remainder(first_number,second_number)}")
prompt("#{first_number} ** #{second_number} = #{power(first_number,second_number)}")