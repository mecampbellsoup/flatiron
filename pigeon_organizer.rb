require 'awesome_print'

########################
# NYC PIGEON ORGANIZER #
########################
 
# Start with the following collected data on NYC pigeons.
 
pigeon_data = {
  :color => {
    :purple => ["Theo", "Peter Jr.", "Lucky"],
    :grey => ["Theo", "Peter Jr.", "Ms .K"],
    :white => ["Queenie", "Andrew", "Ms .K", "Alex"],
    :brown => ["Queenie", "Alex"]
  },
  :gender => {
    :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
    :female => ["Queenie", "Ms .K"]
  },
  :lives => {
    "Subway" => ["Theo", "Queenie"],
    "Central Park" => ["Alex", "Ms .K", "Lucky"],
    "Library" => ["Peter Jr."],
    "City Hall" => ["Andrew"]
  }
}

def get_bird_names pigeon_data
  names_array = []
  pigeon_data.each do |attr, attr_values|
    attr_values.each do |option, birds_which_match_that_option|
      names_array << birds_which_match_that_option
    end
  end
  names_array.flatten.uniq!
end

def get_attribute_for_bird pigeon_data, name, attribute
  attr_match = []
  pigeon_data[attribute.to_sym].each do |attr, birds_of_that_attr|
    birds_of_that_attr.each do |bird|
      attr_match << attr if bird == name
    end
  end
  if attr_match.size == 1
    attr_match[0]
  else
    attr_match
  end
end

def pigeon_list_from_data pigeon_data
  pigeon_list = {}
  # let's get one bird's colors first as {"Theo" => {:color => ["purple", "grey"]}}
  get_bird_names(pigeon_data).each do |bird_name|
    pigeon_list[bird_name] = {
      pigeon_data.keys.first => get_attribute_for_bird(pigeon_data, bird_name, pigeon_data.keys.first),
      pigeon_data.keys[1]    => get_attribute_for_bird(pigeon_data, bird_name, pigeon_data.keys[1]),
      pigeon_data.keys[2]    => get_attribute_for_bird(pigeon_data, bird_name, pigeon_data.keys[2])
    }
  end
  pigeon_list
end

ap pigeon_list_from_data(pigeon_data)

# pigeon_list = {
#   "Theo" => {
#     :color => ["purple", "grey"],
#     :gender => "male",
#     :lives => "Subway"
#   },
#   "Peter Jr." => {
#     :color => ["purple", "grey"],
#     :gender => "male",
#     :lives => "Library"
#   },
#   "Lucky" => {
#     :color => ["purple"],
#     :gender => "male",
#     :lives => "City Hall"
#   },
#   "Ms .K" => {
#     :color => ["grey", "white"],
#     :gender => "female",
#     :lives => "Central Park"
#   },
#   "Queenie" => {
#     :color => ["white", "brown"],
#     :gender => "female",
#     :lives => "Subway"
#   },
#   "Andrew" => {
#     :color => ["white"],
#     :gender => "male",
#     :lives => "Central Park"
#   },
#   "Alex" => {
#     :color => ["white", "brown"],
#     :gender => "male",
#     :lives => "Central Park"
#   }
# }