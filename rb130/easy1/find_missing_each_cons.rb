
def missing(sorted_arr)
  missing_integers = []
  sorted_arr.each_cons(2) do |first, second|
    missing_integers.concat(((first + 1)..(second -1)).to_a)
  end
  missing_integers
end

p missing([-3, -2, 1, 5])
p missing([1,2,3,4])
p missing([1,5])
p missing([6])