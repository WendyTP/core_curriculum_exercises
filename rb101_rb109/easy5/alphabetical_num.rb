=begin
input: an array of integers between 0 and 19
output: an array of these integers sorted based on the English words for each number
data: hash
algorithm:
  - create a constanct varialbe for stroing an array of english words
  - within the method:
    - create a hash variable (empty hash)
    - iterate through the given array
      - hash[key = each item] = value (value == the engilish word associated)
    - sort this updated hash by it's value (return an array); transform it back to a hash
    - insert each key to an array
    - retrn this new array  
=end

ENGLISH_NUMBERS = %w(zero one two three four five six seven eight 
  nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)


# simpler way- sort the array directly

def alphabetic_number_sort(numbers)
  numbers.sort_by {|number| ENGLISH_NUMBERS[number] }
end 


#first attempt -- using hash
=begin
def alphabetic_number_sort(numbers)
  alphabet_number_hash = numbers.each_with_object({}) do |number,hash|
    hash[number] = ENGLISH_NUMBERS[number]
  end
  
  alphabet_number_hash.sort_by {|number,alphabet| alphabet}.each_with_object([]) do |(number,alphabet),array|
    array << number
  end
end
=end



# Further exploration - using Enumerable#sort
=begin
def alphabetic_number_sort(numbers)
  alphabet_array = numbers.each_with_object([]) {|number,array| array << ENGLISH_NUMBERS[number] }
  alphabet_array.sort.each_with_object([]) {|alphabet, sorted_array| sorted_array << ENGLISH_NUMBERS.index(alphabet)}
end
=end


p alphabetic_number_sort((4..10).to_a)
p alphabetic_number_sort((0..19).to_a)


