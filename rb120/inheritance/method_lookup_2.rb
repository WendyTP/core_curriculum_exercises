class Animal
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new
cat1.color

# method look up path when invoking cat1.color
=begin
Cat
Animal
Object
Kernel
BasicObject

=end