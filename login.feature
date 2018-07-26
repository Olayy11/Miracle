Feature: Login to Outeast
  Background:
    Given I am on Outeast

  #LOGIN
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


    #REGISTRATION
  Scenario: Sign_up via valid data
    When I click on 'Sign up'
    When I login with email and "qwertyQ1" password
    Then I successfully registered

  Scenario: Sign_up via already registered data
    When I click on 'Sign up'
    When I login with "jackvaler@gmail.com" username and "qwertyQ1" password
    Then I successfully registered

  Scenario: Sign_up via invalid gmail
    When I click on 'Sign up'
    When I login with "jackvalergmail.com" username and "qwertyQ1" password
    Then I see message about wrong email

  Scenario: Sign_up via invalid password
    When I click on 'Sign up'
    When I login with email and "qwerty" password
    Then I see message about wrong password

  Scenario: Sign_up via empty password
    When I click on 'Sign up'
    When I login with email and "" password
    Then I see message about empty password

  Scenario: Sign_up via empty login
    When I click on 'Sign up'
    When I login with "" username and "qwertyQ1" password
    Then I see message about empty email

  Scenario: Sign_up via empty data
    When I click on 'Sign up'
    When I login with "" username and "" password
    Then I see message about empty fields