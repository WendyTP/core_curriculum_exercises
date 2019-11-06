require 'minitest/autorun'

class IncludeTest < MiniTest::Test
  def test_obj_in_collection
    list = [1,2,"xyz"]
    value = "xyz"
    assert_includes(list, value )
  end

  def test_obj_in_collection1
    list = [1,2,nil]
    value = "xyz"
    assert_includes(list, value)
  end
end