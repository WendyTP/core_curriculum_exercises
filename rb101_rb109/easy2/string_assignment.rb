name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name

=begin
The above code should print out: name => 'Alice', save_name => 'Bob'
=end

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

=begin
The above should print out: name => 'BOB' , save_name => 'BOB'
Both name and save_name are pointed to the same string object 'Bob' at first,
when the .upcase! method is applied to the string object 'Bob' via access from name,
Ruby applies this change directly onto the object without making any copy.
Since both name and save_name are still pointing to the same string object, this change therefore also 
reflects onto the value that save_name variable reference to.
=end