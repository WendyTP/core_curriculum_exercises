=begin
input: a string
output:  a boolean of true or false
rules: 
- returns true if all parentheses in the string are properly balanced, false otherwise
- To be properly balanced, parentheses must occur in matching '(' and ')' pairs.
- balanced pairs must each start with a (, not a ).
algorithm:
return false if the number of "(" + ")" is not even
set a counter  = 0
iterate through the strings,
when "(" , counter += 1
when ")", counter -= 1

=end


def balanced?(str)
  return false if str.count("(") != str.count(")")

  counter = 0
  str.chars.each do |char|
    counter += 1 if char == "("
    counter -= 1  if char == ")"
    break if counter < 0
  end

  counter.zero?
end

puts balanced?('What (is) this?')
puts balanced?('What is) this?')
puts balanced?('What (is this?')
puts balanced?('((What) (is this))?')
puts balanced?('((What)) (is this))?')
puts balanced?('Hey!')
puts balanced?(')Hey!(')
puts balanced?('What ((is))) up(')
puts balanced?('((What) )is this))?')