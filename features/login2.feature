Feature: Login to Outeast
  Background:
    Given I am on Outeast

  Scenario: Sign_up via empty data
    When I click on 'Sign up'
    When I login with "" username and "" password
    Then I see message about empty fields
    And Maks love Olka