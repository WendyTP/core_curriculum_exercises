=begin
requirement: calculate which date is the meetup with given month, year, weekday and schedule
  - 7 days end in "...teenth" of a month: 
  thirteenth, fourteenth, fifteenth, sixteenth, seventeenth, eighteenth, nineteenth
  - return Date.new(year, month, date)
algorithm:
  - check the weekday of 1st of month
  - get to the required weekday -- the first 
  - add 7 days * times (second, third.. last)
   - if its teenth, keep adding date until the day is between 13-19th
  - return the calculated date for creating a Date object
=end

require 'date'

class Meetup
  attr_reader :given_month, :given_year
  WEEKDAYS = {sunday: 0, monday: 1, tuesday: 2, wednesday: 3, thursday: 4, friday: 5, saturday: 6}
  SCHEDULES = [:first, :second, :third, :fourth, :last]
  TEENTH_DATES = (13..19)
  DAYS_IN_WEEK = 7
  
  def initialize(month, year)
    @given_month = month
    @given_year = year
  end


  def day(weekday, schedule)
    first_date_of_given_weekday = calculate_first_date_of_given_weekday(weekday)

    if schedule == :teenth
      calculate_teenth_date(first_date_of_given_weekday)
    elsif schedule != :first
      calculate_date_not_in_first_week_of_month(first_date_of_given_weekday, schedule)
    else
      first_date_of_given_weekday
    end
  end

  def calculate_date_not_in_first_week_of_month(date, schedule)
    date += (DAYS_IN_WEEK * SCHEDULES.index(schedule))
    if schedule == :last && date.month != given_month
      date -= 7
    end
    date
  end

  def calculate_teenth_date(date)
    while !TEENTH_DATES.include?(date.day)
      date += 7
    end
    date
  end

  def calculate_first_date_of_given_weekday(weekday)
    first_date = Date.new(given_year, given_month, 01)
    while first_date.wday != WEEKDAYS[weekday]
      first_date = first_date +  1
    end
    first_date
  end
end
