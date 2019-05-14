=begin
input:  4 x user inputs of strings
output: a string containing all 4 user inputs
rules: assume user input is valid (no empty)
=end

puts "Enter a noun: "
noun = gets.chomp

puts "Enter a verb: "
verb = gets.chomp

puts "Enter a adjective: "
adjective = gets.chomp

puts "Enter a adverb: "
adverb = gets.chomp

puts "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"
