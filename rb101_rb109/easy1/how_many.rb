=begin
input : an array of string, num,etc (assume input correct)
output : print strings (car => 4 )
rule: words in array are case-senstive
set first element as saved word
set count as 1
iterate from the next word,
if next word has same value as the saved word
  count += 1
iterate until end of the array
print the saved word and the total count
remove all these words that has same value as first word from the array

re-do the process from set first elment,
until the length of array is 0
=end

# more concise - using hashes - case insentive
def count(arr)
  hash = {}
  new_arr = []
  
  arr.map do |element|
    element = element.downcase if element.is_a?(String)
    new_arr << element
  end

  new_arr.each do |element|
    hash[element] = new_arr.count(element)
  end

  hash.each do |key, value|
    puts "#{key} => #{value}"
  end
end

veg = [
  "Spinach", "cabbage", "peas",
  "spinach", "peas", "spinach",
  3, 8, 3
]

count(veg)
print veg
# improvement
def counting(array)
  while array.length > 0 # main loop
    first_element = array.first
    same_values = array.select {|n| n == first_element}
    count = same_values.length
    array = array - same_values
    puts " #{first_element} => #{count}"
  end
end  

  fruits = [
    "orange","banana", "berry", "orange", "berry", "pear",
    "pear", "banana", "orange", "berry"
  ]

  counting(fruits)

# first attempt  
def count_occurrences(given_array)
  while given_array.length > 0 # main loop
    first_element = given_array.shift
    count = 1
    given_array.map do |element|
      if first_element == element
        count += 1
      end  
    end
    same_values = given_array.select {|n| n == first_element}
    given_array = given_array - same_values
    puts " #{first_element} => #{count}"
    
  end
end    

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)


def counting(array)
  while array.length > 0 # main loop
    first_element = array.first
    same_values = array.select {|n| n == first_element}
    count = same_values.length
    array = array - same_values
    puts " #{first_element} => #{count}"
  end
end  

  fruits = [
    "orange","banana", "berry", "orange", "berry", "pear",
    "pear", "banana", "orange", "berry"
  ]

  counting(fruits)

