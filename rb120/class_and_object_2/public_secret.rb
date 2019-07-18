class Person
  attr_accessor :secret

  #@secret = ""
end



person1 = Person.new
puts person1.secret
person1.secret = 'Shh.. this is a secret!'
puts person1.secret

