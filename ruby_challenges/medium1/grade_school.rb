=begin
requirement:
  - create a school for storing grade and names
  - add name and grade
  - sorted list of all name and grades (grade and name to be sorted order)
data:
hash {1 => ["Anna", "Barb", "Charlie"], 2 => {"Dan", Harry}...}

=end

class School
  attr_reader :school
  def initialize
    @school = Hash.new([])
  end

  def to_h
    # sorted school list
    sorted_grade_list = @school.sort.to_h
    sorted_grade_list.map do |grade, names|
      [grade, names.sort]
    end.to_h

  end

  def add(name, grade)
    if school.has_key?(grade)
      school[grade] << name
    else
      school[grade] = [name]
    end
  end

  def grade(grade)
    # return an array of names of the grade or empty array
    school[grade]
  end
end