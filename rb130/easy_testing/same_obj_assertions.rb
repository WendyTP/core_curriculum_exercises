require 'minitest/autorun'

class SameObjectTest < MiniTest::Test
  def test_same_obj
    # assume we have variable list and a method process
    assert_same(list, list.process)
  end
end