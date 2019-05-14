=begin
input: a string
output: an array containing substrings that ar palindromic
rules: use substrings method; case sensitive; 
  single char is not palindrome
=end


def substrings_at_start(sub_str)
  substrings =[]
  1.upto(sub_str.size) do |count|
    substrings << sub_str.slice(0,count)
  end
  substrings
end

def substrings(str)
  result_arr = []
  0.upto(str.size-1) do |count|
    current_string = str.slice(count,str.size)
    result_arr << substrings_at_start(current_string)
  end
  result_arr.flatten
end


def palindromes(str)
  all_sub_list = substrings(str)
  all_sub_list.select do |sub_string|
    sub_string.size > 1 && sub_string == sub_string.reverse
  end  
end

p palindromes("abcd")
p palindromes("madam")
p palindromes("hello-madam-did-madam-goodbye")
p palindromes("knitting cassettes")


=begin
# further exploration
# ignore all non-alphanumeric charcters
def net_palindromes(str)
  net_sub_list = substrings(str).select do |sub_string|
    sub_string.count("^a-zA-Z0-9") == 0
  end
  net_sub_list.select do |sub|
    sub.size > 1 && sub == sub.reverse
  end
end

p net_palindromes("abcd")
p net_palindromes("madam")
p net_palindromes("hello-madam-did-madam-goodbye")
p net_palindromes("knitting cassettes")

=end


