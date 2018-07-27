Feature: Login to Outeast
  Background:
    Given I am on Outeast

  Scenario: Login via registered data
    When I click on 'Sign up'
    When I login with email and "qwertyQ1" password
    Then I successfully login

  Scenario: Search by 3 characters
    When I click on 'Search'
    When I start writing "Ama" town
    Then I should see "Amagansett"

