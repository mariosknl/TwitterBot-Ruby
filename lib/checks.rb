require 'rubygems'
require 'twitter'
require 'dotenv'
Dotenv.load

class RetweetBot
  def initialize
    @client = Twitter::REST::Client.new do |config|
    config.consumer_key         = Env["CONSUMER_KEY"]
    config.consumer_secret      = Env["CONSUMER_SECRET"]
    config.access_token         = Env["ACCESS_TOKEN"]
    config.access_token_secret  = Env["ACCESS_TOKEN_SECRET"]
    end
  end

  def retweet_method 
    topic = "#tsandpipers_88"
    my_followers = @client.follower_ids

    my_followers.each do |follower_id|
      @client.user_timeline(follower_id, result_type: "recent").each do |tweet|
        if tweet.text.include? topic
          p @client.retweet(tweet.id)
          p @client.retweet(tweet.id).class
          @client.retweet(tweet.id)
        end
      end
    end
  end
end
