Feature: Sign_up to Outeast
  Background:
    Given I am on Outeast

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