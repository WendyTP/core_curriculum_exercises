



def merge(arr1, arr2)
  clone1 = arr1.clone
  clone2 = arr2.clone
  result = []

  loop do 
    break if clone1.empty? || clone2.empty?
    if clone1.first < clone2.first
      result << clone1.shift
    elsif clone2.first < clone1.first
      result << clone2.shift
    else
      result << clone1.shift << clone2.shift
    end
  end

  if clone1.empty? && !clone2.empty?
    clone2.size.times {result << clone2.shift }
  elsif clone2.empty? && !clone1.empty?
    clone1.size.times {result << clone1.shift}
  end
  result
end


arr1 = [1,5,9]
arr2 = [2,6,8]
p merge(arr1, arr2)
p arr1
p arr2


arr1 = [1,1,3]
arr2 = [2,2]
p merge(arr1, arr2)
p arr1
p arr2


arr1 = []
arr2 = [1,4,5]
p merge(arr1, arr2)
p arr1
p arr2


arr1 = [1,4,5]
arr2 = []
p merge(arr1, arr2)
p arr1
p arr2
