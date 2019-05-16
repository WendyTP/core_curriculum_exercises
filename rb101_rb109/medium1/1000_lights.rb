=begin  
input: one integer (total num of switches)
output: return an array (which lights are on)
rules:
  n switches = n repetitons
  1st = all n are on ("on")

algorithm:
create an array insert  n of "on" -> 1st round
iterate through the array n-1 times
  each time check on the elemetns at product of each time:
  if element == "on" change to "off"
  if element == "off" change to "on"
after iteration
creates an empty array, and insert index of elements from first array,if element == "on"
=end

# my approach - using array
=begin
def initialise_lights(number_of_lights)
  lights = Array.new(number_of_lights, "on")
  lights
end

def toggle_every_nth_light(lights,nth)
  lights.each_with_index do |light, index|
    if (index +1) % nth == 0 
    lights[index] = (light == "on") ? "off" : "on"
    end
  end
  lights
end


def toggle_lights(number_of_lights)
  lights = initialise_lights(number_of_lights)
  
  2.upto(number_of_lights) do |n|
    lights = toggle_every_nth_light(lights,n)
  end  
  
  on_lights = []
  lights.each_with_index do |light, index|
    on_lights << (index+1) if light == "on"
  end

  on_lights  
end
=end

# simplier approach - using hash data structure

# initialize the lights hash
def initialise_lights(number_of_lights)
  lights = {}
  1.upto(number_of_lights) do |count|
    lights[count] = "off"
  end
  lights
end

# toggle every nth light in lights hash
def toggle_every_nth_light(lights,nth)
  lights.each do |key, value|
    if key % nth == 0
      lights[key] = (value == "off") ? "on" : "off"
    end
  end
  
  lights
end

# return list of light numbers that are on
def on_lights(lights)
  lights.select {|key,value| value == "on"}.keys
end

# Run entire program for number of lights
def toggle_lights(number_of_lights)
  lights = initialise_lights(number_of_lights)
  1.upto(number_of_lights) do |n|
    lights = toggle_every_nth_light(lights,n)
  end
  on_lights(lights)
end


p toggle_lights(5)
p toggle_lights(10)
