
#first attempt
=begin
class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def rename(new_name)
    @name = new_name
  end
end
=end

# refactoring
class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def rename(new_name)
    self.name=(new_name)
  end
end

kitty = Cat.new('Sophie')
puts kitty.name
kitty.rename('Chloe')
puts kitty.name