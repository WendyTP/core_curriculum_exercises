

def standard_star_line(n)
  space = " "
  star = "*"
  number_of_space_from_middle = n / 2
  (space * number_of_space_from_middle) + star  + (space * number_of_space_from_middle)
end

def star(n)
  star = "*"
  center_position = n / 2

  0.upto(center_position - 1) do |line_position|
    current_line = standard_star_line(n)
    current_line[line_position] = star
    current_line[-(line_position + 1)] = star
    puts current_line
  end

  center_line = star * n
  puts center_line

  (center_position - 1).downto(0) do |line_position|
    current_line = standard_star_line(n)
    current_line[line_position] = star
    current_line[-(line_position + 1)] = star
    puts current_line
  end
end

# star(7)
star(9)