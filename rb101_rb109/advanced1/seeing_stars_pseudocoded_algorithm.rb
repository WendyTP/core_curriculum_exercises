=begin
1. Understand problem:
  1-1. 
    - Given an integer n which is an odd number >= 7.
    - write a method that will print out a 8-pointed star
    - The star is in a n x n grid
  1-2.
    - input: an odd number that is >= 7
    - output: nth lines of strings with " " and "*"
    - rules: the return value is a n x n grid 
2. examples: 
3. Approach:
  Start by setting each star line (except middle line) as a string of n-1 space and 1 star in the middle.
  iterate from top line until middle line:
    - change space to star at current line index, and current line index counting from the end of string
  create middle line with all stars
  iterate from the line after middle line to bottom line:
  - change space to star at (current line - 1 ) index, and current line index counting from the end of string.
4. Algorithm:
  4-1. write 1st method that takes one argument (odd number):
      - initialise a standard star line: a string of n x space (" ") with middle space replaced by a star ("*").
  4-2. write 2nd method that takes one argument (odd number).
  4-3. iniialise a local variable called centre_position, which is (n / 2).
  4-5. iterate from top line (index 0) to centre position (not including centre position):
      - call the 1st method to create a star line, and save the return value to local variable called current_line.
      - replace the space at current iteration index and -(current index + 1), with star.
      - print out the updated star line.
  4-6. create and print out the middle star line (with n x stars).
  4-7. iterate from line after middle star line(centre position - 1) down to bottom line( index 0):
      - call the 1st method to create a star line, and save the return value to local variable called current_line.
      - replace the space at current iteration index and -(current index + 1), with star.
      - print out the updated star line.

  =end
