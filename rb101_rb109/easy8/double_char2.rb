=begin
input: a string
output: returns a new string, only every consonant is doubled
=end

CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)

def double_consonants(str)
  result = ""
  str.each_char do |char|
    if CONSONANTS.include?(char.downcase)
      result << char * 2
    else
      result << char
    end
  end
  
  result
end


puts double_consonants("String")
puts double_consonants("Hello-World!")
puts double_consonants("July 14th")
p double_consonants("")