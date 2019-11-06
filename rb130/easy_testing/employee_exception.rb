class NoExperienceError < StandardError; end

class Employee
  
  def initialize(experience)
    @experience = experience
    @hire = false
  end

  def hire
    raise NoExperienceError, "employee doesn't have experience" unless @experience > 0
    @hire = true
  end

  def hired?
    @hire
  end
end

pete = Employee.new(2)
pete.hire
puts pete.hired?

ben = Employee.new(0)
puts ben.hired?
#ben.hire
