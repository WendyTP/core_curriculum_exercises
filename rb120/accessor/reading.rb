class Person
  attr_writer :name
  attr_reader :name
end

person1 = Person.new
person1.name = 'Jessica'
puts person1.name