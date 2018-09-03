Feature: Login to Outeast
  Background:
    Given Visitor is at Outeast

  Scenario: Login via valid data
    When Visitor clicks on 'Sign in'
    When Visitor tries to login with "8@gmail.com" username and "qwertyQ1" password
    Then User successfully logged

  Scenario: Login via invalid data
    When Visitor clicks on 'Sign in'
    When Visitor  tries to login with "822@gmail.com" username and "qwerty2Q1" password
    Then Visitor should see message about invalid email or password

  Scenario: Login via empty fields
    When Visitor clicks on 'Sign in'
    When Visitor tries to login with "" username and "" password
    Then Visitor should see message about empty fields

  Scenario: Login via empty email
    When Visitor clicks on 'Sign in'
    When Visitor tries to login with "" username and "qwertyQ1" password
    Then Visitor should see message about empty email

  Scenario: Login via empty password
    When Visitor clicks on 'Sign in'
    When Visitor tries to login with "8@gmail.com" username and "" password
    Then Visitor should see message about empty password

  Scenario: Login via not registered data
    When Visitor clicks on 'Sign in'
    When Visitor tries to login with email and "fgfgfg2n" password
    Then Visitor should see message about not registered data