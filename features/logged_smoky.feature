Feature: Smoky
  Background:
    Given I am on Outeast
    And I logged

  Scenario: Save Search
    Then I go to Rentals page
#    And I am registered
    Then I select town "Laurel"
    Then I click SEE RESULTS
    Then I click Save Search
    And  I should see SAVED search
    Then I click SAVED
    And  I should see SAVE search


  Scenario: Save listing
    When I go to Rentals page
    Then I click "SAVE" listing, I should see "SAVED"
    Then I click "SAVED" listing, I should see "SAVE"

  Scenario: Save/HDP
    When I go to Sales page
    Then I click any listing
    Then I click Save
    And I should see saved listing hdp
    Then I click SAVED hdp
    And I should see save listing


  Scenario: Agent page click listing
    When I'm on Agent page
    Then I click any listing
    And I should see HDP

  Scenario: Agent page save listing
    When I'm on Agent page
#    Then I am registered
    Then I click "SAVE" listing, I should see "SAVED"
    And I should see "SAVED preview" on the map
    Then I click "SAVED" listing, I should see "SAVE"

  Scenario: Agent page save preview
    When I'm on Agent page
    Then I click "SAVE" listing, I should see "SAVED"
    And I should see "SAVED preview" on the map
    Then I click "SAVED preview" preview on the map
    And I should see "SAVE preview" on the map

  Scenario: Agent page, direct from preview
    When I'm on Agent page
    Then I click "SAVE" listing, I should see "SAVED"
    Then I click review on the map
    And I should see HDP