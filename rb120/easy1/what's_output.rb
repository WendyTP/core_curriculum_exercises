class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s  # the to.s method here is Ruby built-in method
  end
  
  def to_s
   "My name is #{@name.upcase}"
  end
end

name = "fluffy"
fluffy = Pet.new(name)  # initalize method is invoked ,thus @name == "Fluffy"
p fluffy.name
puts fluffy    # puts method calls the to.s custom method from our class on its argument( ie. fluffy object), thus return "My name is FLUFFY" 
(# puts fluffy == puts fluffy.to_s)
puts fluffy.name
puts name