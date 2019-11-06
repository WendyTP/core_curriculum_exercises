class Student
  @@total_students = 0
  def initialize(name = nil, year = nil)
    @name = name
    @year = year
    @@total_students += 1
  end

  def self.total_students
    @@total_students
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    super(name, year)
    @parking = parking
  end
end

class Undergraduate < Student
  def initialize(name, year)
    super
  end
end

class StudentOnLeave < Student
  def initialize
    super()
  end
end

gratuate = Graduate.new("A", 12, "ok")
under = Undergraduate.new("B", 5)
leave = StudentOnLeave.new
p gratuate
p under
p leave