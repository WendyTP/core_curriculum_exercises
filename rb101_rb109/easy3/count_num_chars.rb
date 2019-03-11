=begin
input: a string
output: total amount of characters given (in string form)
rules: 
  - spcaes should not be counted in as characters
  - assume other symbols are counted as charcters
data: use array to perform the calculation
algorithm:
  - request user for a string input
  - set a variable (user_string) for user's input
  - split characters of user_string 
  - save the result into an array variable (splitted_string)
  - print the number of characters
=end

print "Please write word or multiple words: "
user_string = gets.chomp

splitted_string = user_string.chars
counted_characters = splitted_string.count {|char| char != " "}

puts "There are #{counted_characters} characters in '#{user_string}' "


# simpler way with String#delete

print "Please write word or multiple words: "
input = gets.chomp

number_of_characters = input.delete(" ").size

puts "There are #{number_of_characters} characters in \"#{input}\"."