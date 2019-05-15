=begin
input: a string 
output: boolean
rules: true if all alphabetic chars are uppercase; false otherwise
empty string returns true
ignore non alphabetic chars
algorithm:
return true for empty str
count if there's more than 1 lowercase char
=end

# first attempt 

def uppercase?(str)
  return true if str.size == 0
  str.count("a-z") == 0 ? true : false
end

# another solution
=begin
def uppercase?(str)
  str == str.upcase
end
=end


puts uppercase?("")
puts uppercase?("t")
puts uppercase?("T")
puts uppercase?('Four Score')
puts uppercase?('FOUR SCORE')
puts uppercase?('4SCORE!')