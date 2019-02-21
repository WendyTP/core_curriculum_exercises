=begin
input: a string (argument is valid)
output: a sting with words revers-spelled when 
there are five or more letters
rule: 
string consist only letter and space
no extra space if less than two words 
algorithm:
split the given string (=> array)
set an empty array
iterate through the split array, 
insert each element to the empty array,
reverse the order of an element if the length
of lement is >= 5
join this new array to become a new sting
=end

# more concise
def reverse(string)
  array =[]
  string.split.each do |word|
    word.reverse! if word.length >= 5
    array <<  word
  end
  array.join(" ")
end

puts reverse("Profession")
puts reverse("Walk around the block")
puts reverse("Launch School")

# first attempt
def reverse_words(string)
  split_string= string.split
  array = []
  split_string.map do |word|
    word = word.reverse if word.length >= 5
    array << word
  end
  array.join(" ")  
end

puts reverse_words("Professional")
puts reverse_words("Walk around the block")
puts reverse_words("Launch School")