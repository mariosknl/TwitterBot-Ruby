require 'rspec'
require_relative '../lib/checks'

RSpec.describe RetweetBot do
    let (:retweet) { RetweetBot.new }
    describe '#follow_method' do
        it "searches for hashtag and follow the users" do
            expect (retweet.follow_method.class).to eq Array
        end
    end

    describe '#retweet_method' do
        it "retweets with hashtag" do
            expect (retweet.retweet_method).to be_a Array
        end
    end
end


