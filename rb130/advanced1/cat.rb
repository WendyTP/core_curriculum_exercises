class Cat
  attr_accessor :name
  def initialize(name)
    @name = name
  end

  def miaow
    "#{name} is miaowing."
  end

end