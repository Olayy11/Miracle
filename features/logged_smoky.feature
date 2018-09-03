Feature: Smoky
  Background:
    Given Visitor is at Outeast
    And Visitor is logged as user

  Scenario: Save Search
    Then User on Rentals page
#    And I am registered
    Then User selects town "Laurel"
    Then User clicks SEE RESULTS
    Then User clicks Save Search
    And  User should see SAVED search
    Then User clicks SAVED
    And  User should see SAVE search

  Scenario: Save listing
    When User on Rentals page
    Then User clicks "SAVE" listing, and should see "SAVED"
    Then User clicks "SAVED" listing, and should see "SAVE"

  Scenario: Save/HDP
    When User on Sales page
    Then User clicks any listing
    Then User clicks Save
    And User should see saved listing hdp
    Then User clicks SAVED hdp
    And User should see save listing

  Scenario: Agent page click listing
    When User on Agent page
    Then User clicks any listing
    And User should see HDP

  Scenario: Agent page save listing
    When User on Agent page
#    Then I am registered
    Then User clicks "SAVE" listing, and should see "SAVED"
    And User should see "SAVED preview" on the map
    Then User clicks "SAVED" listing, and should see "SAVE"

  Scenario: Agent page save preview
    When User on Agent page
    Then User clicks "SAVE" listing, and should see "SAVED"
    And User should see "SAVED preview" on the map
    Then User clicks "SAVED preview" preview on the map
    And User should see "SAVE preview" on the map

  Scenario: Agent page, direct from preview
    When User on Agent page
    Then User clicks "SAVE" listing, and should see "SAVED"
    Then User clicks review on the map
    And User should see HDP