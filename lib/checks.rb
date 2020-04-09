require 'rubygems'
require 'twitter'
require 'dotenv'
Dotenv.load

class RetweetBot
  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['CONSUMER_KEY']
      config.consumer_secret = ENV['CONSUMER_SECRET']
      config.access_token = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    end
    @arr = []
  end

  def check_tweets
    @arr = @client.search('#tsandpipers_88', result_type: 'recent').take(15)
  end

  def twitter_bot_follow
    @arr.each do |i|
      @client.follow(i.user.id) unless i.user.screen_name == 'TSandpipers'
    end
  end

  def twitter_bot_retweet
    @arr.each do |tweet|
    @client.retweet(tweet.id)
    end
  end
end
