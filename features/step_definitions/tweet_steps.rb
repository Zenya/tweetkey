Given /^a tweetkey exists$/ do
  @tweet = Tweet.new(:id => 1)
  @tweet.save
end

Given /^I edit that tweet$/ do
  visit edit_tweets_path(@tweet)
end
