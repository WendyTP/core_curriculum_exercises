require 'minitest/autorun'

require_relative 'employee_exception'

class ExceptionTest < MiniTest::Test
  def test_exception
    pete = Employee.new(0)
    assert_raises(NoExperienceError) do
      pete.hire
    end
  end

  def test_exception1
    anna = Employee.new(3)
    assert_raises(NoExperienceError) do
      anna.hire
    end
  end
end