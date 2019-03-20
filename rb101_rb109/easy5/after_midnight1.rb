=begin
input: an integer (0, negative or positve)
output: a string rep of 24 hr time format (hh:mm)
rules:
  - time of day represented by minutes:  positive number => after midnight ; negative => before midnight
  - write a method that takes a time using this minute-based format, and return the time of day in 24 hr format
  - can not use Date and Time classes
  - Disregard Daylight Savings and Standard Time and other complications.
examples: time_of_day(0) == "00:00" ; time_of_day(-3) == "23:57"; time_of_day(35) == "00:35"
algorithm:
  - if input is negative:
      hour, minute =input.divmod(60)
      if hour <= -24 ,
        day,hour = hour.divmod(24)
      if hour > -24,
        hour = 24+(hour)
  - if input is 0 or positive:
      hour,minute = input.divmod(60)
      if hour >= 24,
        day,hour = hour.divmod(24)
  
  add "0" in front of minute or hour if number < 10

  return string inte of hour and minute
=end

# simpler way and use Kernel#format + consider day in week
MINUTES_PER_HOUR = 60
HOUR_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOUR_PER_DAY
DAYS_PER_WEEK = 7
DAYS = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]

def time_of_day(delta_minutes)
  delta_minutes = delta_minutes % MINUTES_PER_DAY
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format("%02d:%02d",hours,minutes)
end

def time_and_day(delta_minutes)
  days = delta_minutes / MINUTES_PER_DAY
  day_of_week = DAYS[days % DAYS_PER_WEEK]
  day_of_week + " " + time_of_day(delta_minutes)
end  

p time_and_day(0)
p time_and_day(-3)
p time_and_day(35)
p time_and_day(-1437)
p time_and_day(3000)
p time_and_day(800)
p time_and_day(-4231)


#first attempt
=begin
def time_of_day(given_integer)
  hour,minute = given_integer.divmod(60)
  if hour.abs >= 24
    day,hour = hour.divmod(24)
  elsif hour > -24 && hour < 0
    hour = 24 + hour
  end

  if hour < 10
    hour = "0" + hour.to_s
  else  
    hour = hour.to_s
  end
  if minute < 10
    minute = "0" + minute.to_s
  else  
    minute = minute.to_s
  end

  hour + ":" + minute
end

p time_of_day(0)
p time_of_day(-3)
p time_of_day(35)
p time_of_day(-1437)
p time_of_day(3000)
p time_of_day(800)
p time_of_day(-4231)

=end

# further exploration- using Time and/or Date class and consider also days of the week
SECONDS_PER_MINUTES = 60

def time_and_day(delta_minutes)
  basetime = Time.new(2019,03,18,00,00)
  result_time = basetime + (delta_minutes * SECONDS_PER_MINUTES)  
  result_time.strftime("%A %H:%M")
end

p time_and_day(0)
p time_and_day(-3)
p time_and_day(35)
p time_and_day(-1437)
