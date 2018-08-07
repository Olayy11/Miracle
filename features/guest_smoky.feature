Feature: Header Seacrh
  Background:
    Given I am on Outeast
    And I am guest

  Scenario: Search by Compact Search Bar
    Then I see Sales is active
    Then I select area ''
    Then I select price ''
    Then I select beds ''
    Then I click SEE HOMES
    And I should see all results with "Ama" in town, selected price and beds


  Scenario: Search by Compact Search Bar
    Then I see Sales is active
    When I click Rentals
    Then I see Rentals is active
    Then I select dates ''
    Then I select area ''
    Then I select price ''
    Then I select beds ''
    Then I click SEE HOMES
    And I should see all results with "Ama" in town, selected price and beds

  Scenario: Listings You’ll Love is shown
    When I see '' Listings You’ll Love
    Then I click one of listings "You’ll Love"
    And I should see page

  Scenario: New to the Market is shown
    When I see '' New to the Market
    Then I click on < button
    And I see new listings
    Then I click on > button
    And I see new listings
    Then I click VIEW ALL
    And I should see page All Hamptons Real Estate and sort by NEW

  Scenario: Trending Properties is shown
    When I see '' Trending Properties
    Then I click on < button
    And I see new listings
    Then I click on > button
    And I see new listings

  Scenario: Hamptons Local Guides from main page
    When I see '' Hamptons Local Guides
    Then I click on < button
    And I see new listings
    Then I click on > button
    And I see new listings
    Then I click VIEW ALL
    And I should see page Hamptons Local Guides
    Then I come back to main page (click on logo)
    Then I click EXPLORE ALL GUIDES
    And I should see page Hamptons Local Guides
    Then I come back to main page (click on logo)
    Then I click on 1 of 3 Local Guides
    And I should see page with this clicked guides

  Scenario: Action from Hamptons Local Guides page
    When I see '' Hamptons Local Guides
    And I all name of local guide
    Then Then I click on 1 of them
    And I should see page with this clicked guides

  Scenario: Action with tabs from one Hamptons Local Guide
    When I see 'What to Expect' is active
    Then I click  New Listings
    And I see 'New Listings' is active
    Then I click Points of interest
    And I see 'Points of interest' is active
    Then I click Things to do
    And I see 'Things to Do' is active

  Scenario: Action with 'What to Expect' tab
    When I on https://staging.outeast.com/town_guides/quogue
    And Median Sale and Median Rent is shown
    Then I click  SEE SALES
    And I see direct to


    Then I click Points of interest
    And I see 'Points of interest' is active
    Then I click Things to do
    And I see 'Things to Do' is active


