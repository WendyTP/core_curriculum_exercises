require 'minitest/autorun'

class KindTest < MiniTest::Test

  def test_kind
    value = 38
    assert_kind_of(Numeric, value, "value is not from Numeric class or its subclasses ")
  end

  def test_kind1
    value = "se"
    assert_kind_of(Numeric,value,"value is not from Numeric class or its subclass")
  end

end