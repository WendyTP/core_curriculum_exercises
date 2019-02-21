=begin
input: a string (assume argument is correct)
output: a string, with words in reverse order
set a variable with the string split (array)
set an empty array
iterate through the string array,
and inset each word (from string array)
to array, from the last index to the first.
joint each words in this updated array
print it
=end

# improvement - using .reverse on array
def reverse(string)
  string.split.reverse.join(" ")
end

puts reverse(" ")
puts reverse("I love veg")
puts reverse ("spinach is cool")

# first attempt
def reverse_sentence(string)
  string_array = string.split
  reverse_array = []
  loop do
    reverse_array << string_array.pop
    break if string_array.length == 0
  end
  reverse_array.join(" ")
end

puts reverse_sentence ("")
puts reverse_sentence ("Hello World")
puts reverse_sentence("Reverse these words") == "words these Reverse"