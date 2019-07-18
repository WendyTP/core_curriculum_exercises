module Transportation
  class Vehicle; end
  
  class Truck < Vehicle
  end

  class Car < Vehicle
  end
end

carr = Transportation::Car.new
puts carr