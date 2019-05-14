=begin
input: a string
output: return a new string, every char is doubled
=end

# first attempt
def repeater(str)
  str.chars.map {|char| char * 2}.join
end  


# another solution using each_char
=begin
def repeater(str)
  result = ""
  str.each_char do |char|
    result << char * 2
  end
  result
end  
=end

puts repeater('Hello') 
puts repeater("Good job!") 
p repeater('')