require 'rspec'
require_relative '../lib/checks'

RSpec.describe RetweetBot do
  let(:retweet) { RetweetBot.new }

  describe '#check_tweets' do
    it 'check for tweet that has tsandpipers_88 hashtag' do
      expect(retweet.check_tweets).to be_a Array
    end
  end

  describe '#twitter_bot_follow' do
    it 'searches for hashtag and follow the users' do
      expect(retweet.twitter_bot_follow.class).to eq Array
    end
  end

  describe '#twitter_bot_retweet' do
    it 'retweets with hashtag' do
      expect(retweet.twitter_bot_retweet).to be_a Array
    end
  end
end
