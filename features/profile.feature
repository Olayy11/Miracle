Feature: Smoky
  Background:
    Given I am on Outeast
    And I logged

  Scenario: Saved items modal
    When I hover the mouse over Saved Items
    And I should see saved items Modal

  Scenario: Saved listings view all
    When I hover the mouse over Saved Items
    And I should see that "Listings" is active
    And I should see all listings with saved icon
    Then I click VIEW ALL saved
    And I should see "/saved_listings" page

  Scenario: Saved Searches view all
    When I hover the mouse over Saved Items
    And I should see that "Listings" is active
    Then I click Searches
    And I should see that "Searches" is active
    Then I click VIEW ALL saved
    And I should see "/saved_searches" page

  Scenario: Click from Saved listing
    When I hover the mouse over Saved Items
    Then I click any saved listing
    And I should see HDP

  Scenario: Click from Saved searches
    When I hover the mouse over Saved Items
    Then I click Searches
    Then I click any saved search
    And I should see SRP