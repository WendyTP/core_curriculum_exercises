=begin
1. Understand problem:
  1-1. 
    - Given a nested array as an argument.
    - The nested array has 3 inner arrays, and each inner array contains 3 elements.
    - Write a method that takes this nested array,
      and returns an array which is the transpose version of this array.
    - Transpose 3 x 3 matrix: exchange the columns and rows of the matrix.
  1-2.
    - input: a nested array (3 x 3 metrix)
    - output: the transpose of the given array
    - rules: 
      - Can not mutate the argument.
      - Can not use Array#transpose method, nor Matrix class.
2. Example:
  input: matrix = [[1,5,8], [4,7,2], [3,9,6]]
  result: new matrix = [[1,4,3], [5,7,9],[8,2,6]]

3. Approach:
  Iterate through the nested array, and at each iteration,
  iterate through each element from the given inner array.
  Place the current element into the corresponding indexed sub-array of a new nested array.

4. Algorithm:
  4-1. Write a method that takes a nested array as an argument.
  4-2. Initialise a local variable called result, assign it an empty array with 3 empty inner array.

  4-3. Iterate through the arguement:
    - At each iteration of a sub array, 
    -iterate through the 3 elements in it:
      - insert the current element to a sub array of result. The sub array has the same index as current element.
      
  4-4. After all iteration, return result (the updated new nested array) to the method.    

=end