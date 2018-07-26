Feature: Sign_Up to Outeast
  Background:

  Scenario: Sign_up via valid data
    And I click on 'Sign up'
    When I login with "jackvaler@gmail.com" username and "qwertyQ1" password
    Then I successfully registered