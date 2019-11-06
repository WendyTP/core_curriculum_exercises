
require 'minitest/autorun'

# first approach using #assert_equal
=begin
class BooleanTest < MiniTest::Test
  def test_boolean
    value = 6
    assert_equal(true, value.odd?)
  end
end
=end

# second approach using #assert
class BooleanTest < MiniTest::Test
  def test_boolean
    value = 6
    assert(value.odd?, "value is not odd")
  end
end


