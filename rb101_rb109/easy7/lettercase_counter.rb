=begin
request: Write a method that takes a string, and then returns a hash that contains 3 entries:
 one represents the number of characters in the string that are lowercase letters, 
one the number of characters that are uppercase letters, and one the number of characters that are neither.
rule: assume input is valid string
input: a string
output: a hash with 3 entries
algorithm:
  - create an empty hash and assign it to a local variable (lettercase_counts)
  - add key (lowercase): 
    - the value of the key would be the counted number of any letter that are lowercase in the given string
  - do the similar process (with differnet counting criteria) for the next 2 keys
  - return the updated hash (lettercase_counts)  
=end

def letter_case_count(str)
  lettercase_counts = {}
  lettercase_counts[:lowercase] = str.count("a-z")
  lettercase_counts[:uppercase] = str.count("A-Z")
  lettercase_counts[:neither] = str.count("^a-zA-Z")
  lettercase_counts
end

p letter_case_count('abCdef 123')
p letter_case_count('AbCd +Ef')
p letter_case_count('123')
p letter_case_count('')