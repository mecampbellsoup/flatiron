require 'json'
require 'rest_client'

reddit_hash = JSON.parse(RestClient.get('http://reddit.com/.json'))