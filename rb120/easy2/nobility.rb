
#first attempt
=begin
module Walkable
  def walk
    "#{self} #{gait} forward"
  end
end

class Cat
  attr_reader :name

  include Walkable

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end

  private

  def gait
    "saunters"
  end
end

class Noble
  attr_reader :name, :title
  include Walkable

  def initialize(name, title)
    @name = name
    @title = title
  end

  def to_s
    "#{title} #{name}"
  end

  private

  def gait
    "struts"
  end
end
=end

# another way
module Walkable
  def walk
    "#{name} #{gait} forward"
  end
end

class Cat
  attr_reader :name

  include Walkable

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

class Noble
  attr_reader :name, :title
  include Walkable

  def initialize(name, title)
    @name = name
    @title = title
  end

  def to_s
    "#{title} #{name}"
  end

  def walk
    "#{title} " + super
  end

  private

  def gait
    "struts"
  end

end

byron = Noble.new("Byron", "Lord")
p byron.walk

kitty = Cat.new("Kitty")
puts kitty.walk