Feature: Smoky
  Background:
   Given I am on Outeast
   And I am guest

  Scenario: Search by Compact Search Bar - SALES
   Then I see Sales is active
   Then I select area "Bridgehampton"
   Then I select min price "2000000" and max price "40000000"
   Then I select beds "2"
   Then I click SEE HOMES
   And I should see all listings with "Bridgehampton" town - SEARCHBAR, TITLE,LISTINGS
   And I should see all listings price between selected price min "2000000" and max "40000000"
   And I should see all listings from selected beds "2"
  # Then I click next page


#  Scenario: Search by Compact Search Bar - RENTALS
#    Then I see Sales is active
#    When I click Rentals
#    And I see Rentals is active
#    Then I select dates "June"
#    Then I select area "Bridgehampton"
#    Then I select min price "2000000"
#    Then I select max price "4000000"
#    Then I select beds "2"
#    Then I click SEE HOMES
#    And I should see all results with "Bridgehampton" in town, selected prices and beds
#
#  Scenario: Listings You’ll Love is shown
#    When I see '' Listings You’ll Love
#    Then I click one of listings "You’ll Love"
#    And I should see page
#
#  Scenario: New to the Market is shown
#    When I see '' New to the Market
#    Then I click on < button
#    And I see new listings
#    Then I click on > button
#    And I see new listings
#    Then I click VIEW ALL
#    And I should see page All Hamptons Real Estate and sort by NEW
#
#  Scenario: Trending Properties is shown
#    When I see '' Trending Properties
#    Then I click on < button
#    And I see new listings
#    Then I click on > button
#    And I see new listings
#
#  Scenario: Hamptons Local Guides from main page
#    When I see '' Hamptons Local Guides
#    Then I click on < button
#    And I see new listings
#    Then I click on > button
#    And I see new listings
#    Then I click VIEW ALL
#    And I should see page Hamptons Local Guides
#    Then I come back to main page (click on logo)
#    Then I click EXPLORE ALL GUIDES
#    And I should see page Hamptons Local Guides
#    Then I come back to main page (click on logo)
#    Then I click on 1 of 3 Local Guides
#    And I should see page with this clicked guides
#
#  Scenario: Action from Hamptons Local Guides page
#    When I see '' Hamptons Local Guides
#    And I all name of local guide
#    Then Then I click on 1 of them
#    And I should see page with this clicked guides
#
#  Scenario: Action with tabs from one Hamptons Local Guide
#    When I see 'What to Expect' is active
#    Then I click  New Listings
#    And I see 'New Listings' is active
#    Then I click Points of interest
#    And I see 'Points of interest' is active
#    Then I click Things to do
#    And I see 'Things to Do' is active
#
#  Scenario: Action with 'What to Expect' tab
#    When I on https://staging.outeast.com/town_guides/quogue
#    And Median Sale and Median Rent is shown
#    Then I click  SEE SALES
#    And I see direct to
#
#
#    Then I click Points of interest
#    And I see 'Points of interest' is active
#    Then I click Things to do
#    And I see 'Things to Do' is active
#
#
