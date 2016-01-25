#!/usr/bin/ruby

require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key = "CONSUMER_KEY"
  config.consumer_secret = "CONSUMER_SECRET"
end

client.search("", :result_type => "recent", :geocode => "32.2317753,-110.9580836,1mi").take(10).each do |tweet|
  puts tweet.created_at
  puts tweet.user.screen_name
  puts tweet.text
  puts "---"
end
