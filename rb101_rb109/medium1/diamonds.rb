

def print_each_line(grid_size, distance_to_centre_line)
  space = " "
  star = "*"
  stars = star * (grid_size - (2 * distance_to_centre_line))
  number_of_space = grid_size - stars.length
  left_side_spaces = space * (number_of_space /2)
  right_side_spaces = space * (number_of_space/2)
  puts "#{left_side_spaces }#{stars}#{right_side_spaces}"
end


def diamond(grid_size)
  max_distance = (grid_size -1) / 2
  max_distance.downto(0) {|distance| print_each_line(grid_size,distance)}
  1.upto(max_distance) {|distance| print_each_line(grid_size,distance)}
  
end  


diamond(5)


# further exploration
=begin
def stars(grid_size, distance_to_centre_line)
  stars_shape = " " * (grid_size - (2 * distance_to_centre_line))
  stars_shape[0] = "*"
  stars_shape[-1] = "*"
  stars_shape
end  


def print_each_line(grid_size, distance_to_centre_line)
  space = " "
  stars = stars(grid_size,distance_to_centre_line)
  number_of_space = grid_size - stars.length
  left_side_spaces = space * (number_of_space /2)
  right_side_spaces = space * (number_of_space/2)
  puts "#{left_side_spaces }#{stars}#{right_side_spaces}"
end


def diamond(grid_size)
  max_distance = (grid_size -1) / 2
  max_distance.downto(0) {|distance| print_each_line(grid_size,distance)}
  1.upto(max_distance) {|distance| print_each_line(grid_size,distance)}
  
end
diamond(5)
=end