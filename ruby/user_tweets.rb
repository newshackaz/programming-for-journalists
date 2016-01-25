#!/usr/bin/ruby

require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key = "CONSUMER_KEY"
  config.consumer_secret = "CONSUMER_SECRET"
end

def collect_with_max_id(collection=[], max_id=nil, &block)
  response = yield(max_id)
  collection += response
  response.empty? ? collection.flatten : collect_with_max_id(collection, response.last.id - 1, &block)
end

def client.get_all_tweets(user)
  collect_with_max_id do |max_id|
    options = {count: 200, include_rts: true}
    options[:max_id] = max_id unless max_id.nil?
    user_timeline(user, options)
  end
end

begin
  tweets = client.get_all_tweets("gabbygiffords")
rescue Twitter::Error::TooManyRequests => error
  puts "Sleeping..."
  sleep error.rate_limit.reset_in + 1
  retry
end

tweets.each do |tweet|
  puts tweet.created_at
  puts tweet.user.screen_name
  puts tweet.text
  puts "---"
end
