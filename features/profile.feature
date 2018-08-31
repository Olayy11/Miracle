Feature: Profile
  Background:
    Given I am on Outeast
    And I logged

  Scenario: Saved items modal
    When I hover the mouse over "Saved Items"
    And I should see saved items Modal

  Scenario: Saved listings "View all"
    When I hover the mouse over "Saved Items"
    And I should see that "Listings" is active
    And I should see all listings with saved icon
    Then I click VIEW ALL saved
    And I should see "/saved_listings" page

  Scenario: Saved Searches view all
    When I hover the mouse over "Saved Items"
    And I should see that "Listings" is active
    Then I click Searches
    And I should see that "Searches" is active
    Then I click VIEW ALL saved
    And I should see "/saved_searches" page

  Scenario: Click from Saved listing
    When I hover the mouse over "Saved Items"
    Then I click any saved listing
    And I should see HDP

  Scenario: Click from Saved searches
    When I hover the mouse over "Saved Items"
    Then I click Searches
    Then I click any saved search
    And I should see SRP

  Scenario: Your account modal
    When I hover the mouse over "Your Account"
    And I should see Your account Modal

  Scenario: Direct from Email Preferences
    When I hover the mouse over "Your Account"
    Then I click "Email Preferences" item
    And I should see "/email_preferences" page

  Scenario: Direct from Edit profile
    When I hover the mouse over "Your Account"
    Then I click "Edit profile" item
    And I should see "/users/edit" page

  Scenario: Log out
    When I hover the mouse over "Your Account"
    Then I click "Sign out" item
    And I should see Signin

#Saved items
  Scenario: Saved listings, main block are shown
    When I hover the mouse over "Saved Items"
    Then I click VIEW ALL saved
    And I should see "/saved_listings" page
    And I should see "Saved Listing" is active
    And I should see "Saved Sales" block
    And I should see "Saved Rentals" block

  Scenario: Saved Sales, click listing
    When I hover the mouse over "Saved Items"
    Then I click VIEW ALL saved
    And I should see Saved Listing block
    Then I click any listing
    And I should see HDP

  Scenario: Saved listings, save
    When I hover the mouse over "Saved Items"
    Then I click VIEW ALL saved
    Then I click SAVED for one listing
    And I should SAVE
    Then I reload page
    And I shouldn't see SAVE

  Scenario: Pagination, saved sale
    When I hover the mouse over "Saved Items"
    Then I click VIEW ALL saved
    Then I click "next" for "saved sale"
    And I should see "2 /" info
    And I should see "Saved Sales" block
    Then I click "prev" for "saved sale"
    And I should see "1 /" info
    And I should see "Saved Sales" block

  Scenario: Pagination, saved listing
    When I hover the mouse over "Saved Items"
    Then I click VIEW ALL saved
    Then I click "next" for "saved rentals"
    And I should see "2 /" info
    And I should see "Saved Rentals" block
    Then I click "prev" for "saved rentals"
    And I should see "1 /" info
    And I should see "Saved Rentals" block

#Saved Searches

