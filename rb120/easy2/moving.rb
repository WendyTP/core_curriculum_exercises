module Movable
  def walk
    "#{name} #{gait} forward"
  end
end


class Person
  attr_reader :name
  include Movable

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  attr_reader :name
  include Movable

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  attr_reader :name
  include Movable

  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end
end

mike = Person.new("Mike")
puts mike.walk

kitty = Cat.new("Kitty")
puts kitty.walk

flash = Cheetah.new("Flash")
puts flash.walk