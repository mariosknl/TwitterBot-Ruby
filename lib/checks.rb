require 'rubygems'
require 'twitter'

class RetweetBot
  def initialize
    @client = Twitter::REST::Client.new do |config|
    config.consumer_key         = "iryzxTMBh6SWRYXIoD7g1v7lc"
    config.consumer_secret      = "femD7YJI6VpiYiuNpsf4Um5Qp2mbAw6YwjNBBs9IKkVV6kU41k"
    config.access_token         = "1245296390659604480-C8z2A4Vk2FowZqmrKFMF78CGHYweNM"
    config.access_token_secret  = "FDeU6xjfxtGJkgY4zx6yVECmGWDS2wLrLlEMdeJMm8BEy"
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
