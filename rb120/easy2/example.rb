class Pet
  attr_reader :type, :petname
  def initialize(type, petname)
    @type = type
    @petname = petname
  end

  def to_s
    "a #{type} named #{petname}."
  end
end

class Owner
  attr_reader :name, :pets
  def initialize(name)
    @name = name
    @pets = []
  end

  def add_pet(pet)
    @pets << pet
  end

  def number_of_pets
    pets.size
  end
    
  def print_pets
    puts pets
  end
end

class Shelter
  def initialize
    @owners = {}
  end

  def adopt(owner, pet)
    owner.add_pet(pet)
    @owners[owner.name] = owner unless @owners.has_key?(owner.name)
  end

  def print_adoptions
    @owners.each do |name, owner|
      puts "#{name} has adopted the following pets:"
      owner.print_pets
    end
  end
end

butterscotch = Pet.new('cat', "Butterscotch")
pudding = Pet.new('cat', 'Pudding')

phanson = Owner.new("P Hanson")
bholmes = Owner.new("B Holmes")

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(bholmes, pudding)

shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adpted pets."

