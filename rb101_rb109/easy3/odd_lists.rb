=begin
input: an array
output: an array containing values of every
other elements of the input array
rules:
  - return separate array from original array
  - original array stays intact
  - elements returned should be on the odd number position
  (index 0,2,4,etc)
  - return an empty array if input is empty array
data: array
algorithm:
  - set a variable (odd_elements) for an empty array
  - iterate through given array,
    insert elements that are on 0th,2nd,4th,etc index
    to odd_elements variable
  - return the odd_elements variable  
=end


def oddities(given_array)
  odd_elements = []
  given_array.each do |item|
    next if given_array.index(item).odd?
    odd_elements << item
  end
  odd_elements
end

# another way
=begin
def oddities(given_array)
  odd_elements = []
  given_array.each_with_index do |item, index|
    odd_elements << item  if index.even?
  end
  odd_elements
end    
=end

def eventies(given_array)
  even_elemets = []
  index = 1
  while index < given_array.size
    even_elemets << given_array[index]
    index += 2
  end
  even_elemets
end

  
p oddities([2, 3, 4, 5, 6])
p oddities([1, 2, 3, 4, 5, 6]) 
p oddities(['abc', 'def'])
p oddities([123])
p  oddities([])

p eventies([2,3,4,5,6])
p eventies([])
p eventies(['abc', 'def'])