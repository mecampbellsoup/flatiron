require 'json'
require 'rest_client'
require 'pry'
require 'open-uri'

reddit_json = JSON.parse(open("http://www.reddit.com/.json").read)
stories = reddit_json["data"]["children"].each do |story|
  puts story["data"]
end


binding.pry