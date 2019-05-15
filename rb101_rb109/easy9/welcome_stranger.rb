=begin
input: 2 arg.- 1 array (2 and more elem) and 1 hash (2 key-values)
output: return a string using the array and hash values
algorithim:
transform the array to a string
return a message with string interpolation of arguments (with hash values added)
=end


def greetings(name_arr, status)
  complete_name = name_arr.join(" ")
  "Hello, #{complete_name}!\
  Nice to have a #{status[:title]} #{status[:occupation]} around."
end


 puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
