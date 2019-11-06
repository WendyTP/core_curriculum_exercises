def transpose(matrix)
  result = [[],[],[]]
  matrix.each do |inner_array|
    inner_array.each_with_index do |element, index|
      result[index] << element
    end
  end
  result
end


matrix = [
  [1,5,8],
  [4,7,2],
  [3,9,6]
]

new_matrix = transpose(matrix)
p new_matrix
p matrix