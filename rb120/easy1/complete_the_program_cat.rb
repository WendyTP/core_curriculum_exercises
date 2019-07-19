class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
  def initialize(name, age, colour)
    super(name,age)
    @colour = colour
  end

  def to_s
    "My cat #{@name} is #{@age} years old and has #{@colour} fur."
  end

end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch