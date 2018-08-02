Feature: Login to Outeast
  Background:
    Given I am on Outeast

  Scenario: Login via valid data
    When I click on 'Sign in'
    When I login with "8@gmail.com" username and "qwertyQ1" password
    Then I successfully login

  Scenario: Login via invalid data
    When I click on 'Sign in'
    When I login with "822@gmail.com" username and "qwerty2Q1" password
    Then I unsuccessfully login

  Scenario: Login via empty fields
    When I click on 'Sign in'
    When I login with "" username and "" password
    Then I see message about empty fields

  Scenario: Login via empty email
    When I click on 'Sign in'
    When I login with "" username and "qwertyQ1" password
    Then I see message about empty email

  Scenario: Login via empty password
    When I click on 'Sign in'
    When I login with "8@gmail.com" username and "" password
    Then I see message about empty password

  Scenario: Login via not registered data
    When I click on 'Sign in'
    When I login with email and "fgfgfg2n" password
    Then I see message about not registered data