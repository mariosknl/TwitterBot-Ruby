require 'rubygems'
require 'twitter'
require 'dotenv'
Dotenv.load

class RetweetBot

  def initialize
    @client = Twitter::REST::Client.new do |config|
    config.consumer_key         = ENV["CONSUMER_KEY"]
    config.consumer_secret      = ENV["CONSUMER_SECRET"]
    config.access_token         = ENV["ACCESS_TOKEN"]
    config.access_token_secret  = ENV["ACCESS_TOKEN_SECRET"]
    @arr = []
    end
  end
  

    def follow_method
    
      topic = "#tsandpipers_88"
    
        x = @client.search(topic, result_type: "recent").take(10)
        @arr = x
        @arr.each do |i|
          @client.follow(i.user.id) unless i.user.screen_name == 'TSandpipers'
        end
    end
      
      def retweet_method 
        @arr.each do |tweet|
          @client.retweet(tweet)
        end
      end
end



