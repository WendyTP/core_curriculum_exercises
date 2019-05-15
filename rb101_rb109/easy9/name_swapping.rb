
=begin
input: a single string contains a first name, a space and a last name
output: a string contains the last name, a comma, a space and the first name
=end

#first attempt

def swap_name(str)
  first_name = str.split[0]
  last_name = str.split[1]
  "#{last_name}, #{first_name}"
end


# another solution using reverse
=begin
def swap_name(str)
  str.split.reverse.join(", ")
end
=end

puts swap_name('Joe Roberts')