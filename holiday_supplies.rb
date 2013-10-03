require 'awesome_print'

holiday_supplies = {
  :winter => {
    :christmas => ["Lights", "Wreath"],
    :new_years => ["Party Hats"]
  },
  :summer => {
    :fourth_of_july => ["Fireworks", "BBQ"]
  },
  :fall => {
    :thanksgiving => ["Turkey"]
  },
  :spring => {
    :memorial_day => ["BBQ"]
  }
}

# How would you access the second supply for the forth_of_july? ex: holiday_supplies[:spring][:memorial_day][0]
holiday_supplies[:summer][:fourth_of_july][1]
# Add a supply to a Winter holiday.
holiday_supplies[:winter][:christmas][2] = "Star"
# Add a supply to memorial day.
holiday_supplies[:spring][:memorial_day][1] = "American flag"
# Add a new holiday to any season with supplies.
holiday_supplies[:fall]["Halloween"] = ["Pumpkin", "Candy", "Hay", "Skulls"]
# Write a method to collect all Winter supplies from all the winter holidays. ex: winter_suppliers(holiday_supplies) #=> ["Lights", "Wreath", etc]
def winter_supplies(holiday_supplies)
  holiday_supplies[:winter].collect do |holiday, supplies|
    supplies
  end.flatten
end

#ap winter_supplies(holiday_supplies)

# Write a loop to list out all the supplies you have for each holiday and the season.
def list_supplies_by_season(holiday_supplies)
  holiday_supplies.each do |season, holidays_hash|
    puts "#{season.to_s.capitalize}:"
    holidays_hash.collect do |holiday, supplies_array|
      pretty_holiday = holiday.to_s.split("_").collect do |word|
        word.capitalize
      end.join(" ")
      print "  #{pretty_holiday}: "
      supplies_array.each_with_index do |supply, index|
        print "#{supply}".strip
        print " and " if index < supplies_array.size-1
        puts "" if index == supplies_array.size-1
      end
    end
  end
end

#ap list_supplies_by_season(holiday_supplies)

# Write a method to collect all holidays with BBQ.

def holidays_with_bbqs(holiday_supplies)
  matched_holidays = []
  holiday_supplies.each do |season, holidays_hash|
    holidays_hash.each do |holiday, supplies|
      matched_holidays << holiday if supplies.include?("BBQ")
    end
  end
  matched_holidays
end

ap holidays_with_bbqs(holiday_supplies)
ap holidays_with_bbqs(holiday_supplies).class
# holidays_with_bbqs(holiday_supplies) #=> [:fourth_of_july, :memorial_day]

