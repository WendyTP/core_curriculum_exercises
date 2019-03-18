=begin
input: two strings as arguments
output: another string
rules:
  - write a method
  - two strings given are of different lengths
  - return result of concatenating the two strings
     short+long+short
data: string
algorithm:
  - if string1 is longer than string2
      return string2+string1+string2
    otherwise
      return string1+string2+string1        
=end


def short_long_short(string1,string2)
  if string1.size > string2.size
    string2 + string1 + string2
  else
    string1 + string2 + string1
  end
end


# another way using sort_by on array --> too complicated for this question
=begin
def short_long_short(string1,string2)
  array = [string1,string2].sort_by {|item| item.length}
  array.first + array.last + array.first
end  
=end

puts short_long_short("abe","defgh")