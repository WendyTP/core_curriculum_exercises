=begin
1. Understand problem:
  1-1. 
    - Given two sorted arrays as arguments for a method.
    - The two sorted arrays can be empty array
    - Write a method that will take these 2 sorted arrays, and return a new sorted array
    - The returned array contains all the elements from the two sorted arrays
  1-2.
    - input: two arrays (can be empty array)
    - output: a new array
    - rules: 
      - the new array need to be sorted 
      - can not sort the result array in the solution
      - must add elemenet to result array one at a time in proper order
      - method can not mutate the given arguments
2. examples:
  - ([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
  - ([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
  - ([], [1, 4, 5]) == [1, 4, 5]
  - ([1, 4, 5], []) == [1, 4, 5]
3. Algorithm:
   3-1. Write a method that takes two array arguments.
   3-2. Clone both two arrays, and assign each cloned array to a local variable called clone1 and clone2.
   3-3. Initialise a local variable called result, and assign it an empty array.
   3-5. Create a loop and start the loop by a breaking condition: 
        - Breaking condition: if  clone1 or clon2 is empty, then exit the loop.
        - If the breaking condition is not met:
          - compare first clone1 element and first clone2 element:
            - if first clone1 element < first clone2 element, 
                then remove the first clone1 element from clone1 array, and insert it to result array.
            - if first clone2 element < first clone1 element,
                then remove the first clone2 element from clone2 array, and insert it to result array.
            - if first clone1 element == first clone2 element,
                then remove both first clone1 element and first clone2 element, and insert them to result array.
    3-6. Once exit the loop, check if it's clone1 or clone2 that is empty:
              - if clone1 is empty and clone2 is not,
                  then iterate through clone2 and insert the rest of elements to result one at a time.
              - if clone2 is empty and clone1 is not,
                  then iterate through clone1 and insert the rest of elements to result one at a time.
    3-7. Return the updated result array to the method.
              
=end