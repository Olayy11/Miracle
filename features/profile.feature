Feature: Profile
  Background:
    Given Visitor is at Outeast
    And Visitor is logged as user

  Scenario: Saved items modal
    When User hovers the mouse over "Saved Items"
    And User should see saved items Modal

  Scenario: Saved listings "View all"
    When User hovers the mouse over "Saved Items"
    And User should see that "Listings" is active
    And User should see all listings with saved icon
    Then User clicks VIEW ALL saved
    And User should see "/saved_listings" page

  Scenario: Saved Searches view all
    When User hovers the mouse over "Saved Items"
    And User should see that "Listings" is active
    Then User clicks Searches
    And User should see that "Searches" is active
    Then User clicks VIEW ALL saved
    And User should see "/saved_searches" page

  Scenario: Click from Saved listing
    When User hovers the mouse over "Saved Items"
    Then User clicks any saved listing
    And User should see HDP

  Scenario: Click from Saved searches
    When User hovers the mouse over "Saved Items"
    Then User clicks Searches
    Then User clicks any saved search
    And User should see SRP

  Scenario: Your account modal
    When User hovers the mouse over "Your Account"
    And User should see Your account Modal

  Scenario: Direct from Email Preferences
    When User hovers the mouse over "Your Account"
    Then User clicks "Email Preferences" item
    And User should see "/email_preferences" page

  Scenario: Direct from Edit profile
    When User hovers the mouse over "Your Account"
    Then User clicks "Edit profile" item
    And User should see "/users/edit" page

  Scenario: Log out
    When User hovers the mouse over "Your Account"
    Then User clicks "Sign out" item
    And User should see Signin

#Saved items
  Scenario: Saved listings, main block are shown
    When User hovers the mouse over "Saved Items"
    Then User clicks VIEW ALL saved
    And User should see "/saved_listings" page
    And User should see "Saved Listing" is active
    And User should see "Saved Sales" block
    And User should see "Saved Rentals" block

  Scenario: Saved Sales, click listing
    When User hovers the mouse over "Saved Items"
    Then User clicks VIEW ALL saved
    And User should see Saved Listing block
    Then User clicks any listing
    And User should see HDP

  Scenario: Saved listings, save
    When User hovers the mouse over "Saved Items"
    Then User clicks VIEW ALL saved
    Then User clicks SAVED for one listing
    And User should SAVE
    Then User reloads page
    And User shouldn't see SAVE

  Scenario: Pagination, saved sale
    When User hovers the mouse over "Saved Items"
    Then User clicks VIEW ALL saved
    Then User clicks "next" for "saved sale"
    And User should see "2 /" info
    And User should see "Saved Sales" block
    Then User click "prev" for "saved sale"
    And User should see "1 /" info
    And User should see "Saved Sales" block

  Scenario: Pagination, saved listing
    When User hovers the mouse over "Saved Items"
    Then User clicks VIEW ALL saved
    Then User click "next" for "saved rentals"
    And User should see "2 /" info
    And User should see "Saved Rentals" block
    Then User click "prev" for "saved rentals"
    And User should see "1 /" info
    And User should see "Saved Rentals" block

#Saved Searches

