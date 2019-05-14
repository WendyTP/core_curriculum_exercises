=begin
input: a non-empty string
output: return a string (1 char or 2 chars)
rules: return 1 char if string is odd num
return 2 chars if string is even num
=end

def center_of(str)
  return str if str.size < 2
  middle_index = (str.size)/2
  if str.size.even?
    str[middle_index-1..middle_index]
  else
    str[middle_index]
  end  
end

puts center_of('I love ruby') == 'e'
p center_of('Launch School')
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'