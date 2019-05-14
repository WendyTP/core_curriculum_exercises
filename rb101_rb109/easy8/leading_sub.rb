=begin
input: a string
output: an array containing sorted substrings 
=end

# first attempt
def substrings_at_start(str)
  substrings =[]
  str.chars.each_with_index do |_, index|
    substrings << str[0..index]
  end
  substrings
 
end

# another solution using .upto
=begin
def substrings_at_start(str)
  substrings =[]
  1.upto(str.size) do |count|
    substrings << str.slice(0,count)
  end
  substrings
end
=end

p substrings_at_start('abc')
p substrings_at_start('a')
p substrings_at_start('xyzzy')