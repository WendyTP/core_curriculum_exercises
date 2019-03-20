=begin
input: a string of 24 hr time format
output: an integer (0 or positive)
rules:
  - write 2 methods : one for after_midnight (count time clockwise); one for before_midnight (count time anti clockwise)
  - if given number is positive: time after midnight; if negative: time before midnight
  - both method should return a value in the range of 0..1439
  - can not use Date and Time classes
data: string- array - integer
algorithm:
- For each method:
  - Convert string input into integer
    - split the string input to an array (hour,minute)
    - convert each element to an integer
- after_midnight method:
  total_minutes = (hour * 60) + minutes
  total_minutes = 0 if hour == 24
- before_midnight method:
  total_minutes = 1440 - (hour * 60 + minutes)
  total_minutes = 0 if hour == 24
=end

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY


# another way- simpler
def after_midnight(time_input)
  hours, minutes = time_input.split(":").map(&:to_i)
  (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
end

def before_midnight(time_input)
  delta_minutes = MINUTES_PER_DAY - after_midnight(time_input)
  delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY
  delta_minutes
end    


# first attempt
=begin
def after_midnight(time_input)
  hours,minutes = time_input.split(":").map{|element| element.to_i}
  if hours == HOURS_PER_DAY
    total_minutes = 0
  else
    total_minutes = (hours * MINUTES_PER_HOUR)+ minutes
  end
  total_minutes
end

def before_midnight(time_input)
  hours,minutes = time_input.split(":").map{|element| element.to_i}
  if hours == HOURS_PER_DAY || hours == 0
    total_minutes = 0
  else
    total_minutes = MINUTES_PER_DAY- ((hours * MINUTES_PER_HOUR)+ minutes)
  end
  total_minutes
end
=end
p after_midnight('00:00')
p before_midnight('00:00')
p after_midnight('12:34')
p before_midnight('12:34')
p after_midnight('24:00')
p before_midnight('24:00') 