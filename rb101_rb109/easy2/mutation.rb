array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
p array2

=begin
array2 should print out ["Moe", "Larry", "CURLY", "SHEMP", "Harpo", "CHICO", "Groucho", "Zeppo"]
array1 and array2 refers to different array objects. After inserting each of array1 elements to array2,
both arrays appear to be the same, though still refering to two different array objects. 
However, each element within array2 is actually the same as array1 (ie. both refering to same set of elements.)
Because of this, when the .upcase! mutates each elemnt that array1 refers to at place, the values within array2 therefore changed. 
=end

array3 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
puts "array3 object id: #{array3.object_id}"
puts "array3 first element obje id: #{array3[0].object_id}"
array4 = []
puts "array4 original object id: #{array4.object_id}"
array3.each { |value| array4 << value.clone }
# puts array4
puts "array4 changed object id: #{array4.object_id}"
puts "array4 element object id: #{array4[0].object_id}"
array3.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array3[0].object_id
puts array4[0].object_id
p array4

=begin
By using .clone for each element copied to array4, array3 and array4 both contain same value,
but refering to different set of elements.
Therefore, the change on the elements of array3 does not impact the elements array4 refer to.
=end