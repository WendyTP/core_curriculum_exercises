module Movable
  def walk
    "#{name} #{gait} forward"
  end
end

class Animal
  attr_reader :name
  include Movable

  def initialize(name)
    @name = name
  end
end

class Person < Animal
  private

  def gait
    "strolls"
  end
end

class Noble < Person
  attr_reader :title

  def initialize(name, title)
    @name = name
    @title = title
  end

  def walk
    "#{title} " + super
  end

  private
  def gait
    "struts"
  end
end

class Cat < Animal

  private

  def gait
    "saunters"
  end
end

class Cheetah < Cat
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

byron = Noble.new("Byron", "Lord")
puts byron.walk