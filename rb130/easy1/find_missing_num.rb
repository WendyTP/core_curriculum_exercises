=begin
input: a sorted arry of integers(at least one) (ex.[1,2,3]; [1,3,5])
output: return a sorted array of all missing integer
        ([], [2,4])
algorithm:
  - create a new empty array
  - if one element in given array
      - return empty array
  - else
      iterate through first til last 2nd element
        - if next element - current element == 1
            skip (next)
        - else
            result = next element - current element
            result.times do |n| 
              result =n + current element
              array << result
            end
=end

def missing(sorted_integers)
  missing_integers = []
  return missing_integers if sorted_integers.size == 1

  ((sorted_integers.size) - 1).times do |idx|
    difference = sorted_integers[idx + 1] - sorted_integers[idx]
    next if difference == 1
    (1...difference).each {|n| missing_integers << (n + sorted_integers[idx])}
  end

  missing_integers
end

p missing([6])
p missing([1,2,3])
p missing([1,5])
p missing([-3, -2, 1, 5])