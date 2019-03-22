# Passing a string to a method
def test_object_id(stri)
  puts stri  # super sunny
  puts stri.object_id   #47130109038960
end

st = "super sunny"
puts st.object_id       #47130109038960
puts test_object_id(st).object_id   #8  (8 for nil)

=begin
The reference to the original string is passed into the test_object_id, and is stored in the stri variable.
Both stri and st variables point to the same string object 

=end

puts ".................................."

# Passing a string to a method, create an array and mutate the array
def spin_me(str) 
  puts str  # hello weekend
  puts str.object_id       #46980376432260
  
  new_array = str.split
  puts new_array.object_id  #46980376432140
  puts str.object_id        #46980376432260

  new_array.each do |word|
    word.reverse!
  end 
  puts new_array    #[olleh dnekeew]
  puts new_array.object_id    #46980376432140
  
  puts new_array.join(" ").object_id    #46980376431900
  puts new_array.object_id  #46980376432140

end

spinee = "hello weekend"
puts spinee.object_id      #46980376432260
puts spin_me(spinee).object_id  #8 (8 for nil)

=begin
The referece to the original string is passed into the spin_me method, and is stored in the str variable.
Both spinee and str variables refer to the same string object ("hello weekend").
When the "hello weekend" is splited, a new array (new_array) is created, which is a completely different object from what str and spinee point to.
From this moment onward, it is the new_array that went through all the rest of the changes, not the original string object ("hello weekend") that str and spinee refer to.
When the new_array passed to each method and each element gets permantely reveresed, it mutates the new_array at place, instead of creating a copy of it.
When the new_array passed to join method, a new string object is then created, which is another completly different object from any of the above objects (id wise).
=end


puts "....................."


# Passing an array to method
def spin_me(arr)
  puts arr    # [hello, world]
  puts arr.object_id  #46980376431660
  arr.each do |word|
    word.reverse!
  end
end

arra = ['hello', 'world']
puts arra.object_id # 46980376431660
puts spin_me(arra).object_id # 46980376431660
puts arra     # [olleh dlrow]

=begin
The reference to the original array ["hello", "world"] is passed in to spin_me method, and is stored in the arr variable.
Both arr and arra variables point to the same array object.
When the elements arr refering to is modified by the reverse! method, the array object that arr refers to is mutated.
Since both arr and arra point to the same array , the change therefore reflects on the arra variable. 
=end