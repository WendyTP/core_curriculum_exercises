=begin
input: a string with words and non-aphabetic chars
output: a string with and spaces
rules:
  - write a method to return a string with only words and spaces
  - Only one space in place of several consecutive non-alphabetic chars
  - 2 spaces  => 1 space
da
ta: string
algorithm:
  - substitue all non-aphabeteic chars with space
  - substitue all multiple spaces with one single space  
  
=end

#first attempt - with regular expressions
def cleanup(sentence)
  sentence.gsub(/\W+/," ")
end

puts cleanup("---what's my +*& line  ?")

# another way- without regular expressions
ALPHANUMERICS = ("a".."z").to_a + ("A".."Z").to_a + (1..9).to_a

def clean_it_up(sentence)
  result =[]
  sentence.chars.map do |char|
    if ALPHANUMERICS.include?(char)
      result << char
    else
      result << " "
    end
  end
  result.join.squeeze(" ") 
end  

puts clean_it_up("---What's my +*& line  ?")