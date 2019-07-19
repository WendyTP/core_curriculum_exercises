class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s  # return "42" (The to_s is Ruby built-in method for every instance of object, which returns the string rep of the object )
  end

  def to_s
    "My name is #{@name.upcase}"
  end
end

name = 42
fluffy = Pet.new(name)
name += 1   # name is reassigned to 43; @name still points to "42"
p fluffy.name  # "42"
puts fluffy   # "My name is 42"
puts fluffy.name  # "42"
puts name   # 43