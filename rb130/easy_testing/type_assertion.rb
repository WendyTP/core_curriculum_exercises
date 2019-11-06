require 'minitest/autorun'

class TypeTest < MiniTest::Test
  def test_type2
    value = 39
    assert_instance_of(Numeric,value)
  end
  
  def test_type
    value = "super"
    assert_instance_of(Numeric, value )
  end
end