class Cat
  def initialize(cat_name)
    @cat_name = cat_name
    puts "Hello! My name is #{@cat_name}!"
  end
end

kitty = Cat.new('Sophie')