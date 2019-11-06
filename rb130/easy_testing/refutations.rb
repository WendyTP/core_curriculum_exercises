require 'minitest/autorun'

class NotIncludeTest < MiniTest::Test
  def test_refutation
    value = "xy"
    list = [1,2, nil]
    refute_includes(list, value)
  end

  def test_refutation1
    value = "xyz"
    list = [1,2, "xyz"]
    refute_includes(list, value, "value is in the list")
  end
end