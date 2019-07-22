class Transform
  attr_reader :value
  
  def initialize(value)
    @value = value
  end

  def uppercase
    value.upcase
  end

  def self.lowercase(new_value)
    new_value.downcase
  end

end

my_data = Transform.new("abc")
puts my_data.uppercase
puts Transform.lowercase("XYZ")
