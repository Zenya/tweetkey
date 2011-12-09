Feature: Manage tweets
  In order to make a tweetkeys
  As an author
  To create and manage tweets

  Background:
    #    Given I sign in as "bob@bob.bob"
    And I press "New tweetkey"
    Then I should be on new tweetkey page

  Scenario: Creating and post tweet 
    Given I am on new tweetkey page
    When I fill in "tweet_hotkey" with "key"
    And I fill in "tweet_description" with "result"
    #    And I select "vim" from "tweet_category_id"
    And I press "Post"
    Then I should be on preview tweetkey page
    And I should see "key"
    And I should see "result"
    #    And I should see "vim"
