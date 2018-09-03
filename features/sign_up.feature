Feature: Sign_up to Outeast
  Background:
    Given Visitor is at Outeast

  Scenario: Sign_up via valid data
    When Visitor clicks on 'Sign up'
    When Visitor tries to login with email and "qwertyQ1" password
    Then User successfully registered

  Scenario: Sign_up via already registered data
    When Visitor clicks on 'Sign up'
    When Visitor tries to login with "jackvaler@gmail.com" username and "qwertyQ1" password
    Then User successfully logged

  Scenario: Sign_up via invalid gmail
    When Visitor clicks on 'Sign up'
    When Visitor tries to login with "jackvalergmail.com" username and "qwertyQ1" password
    Then Visitor should see message about wrong email

  Scenario: Sign_up via invalid password
    When Visitor clicks on 'Sign up'
    When Visitor tries to login with email and "qwerty" password
    Then Visitor should see message about wrong password

  Scenario: Sign_up via empty password
    When Visitor clicks on 'Sign up'
    When Visitor tries to login with email and "" password
    Then Visitor should see message about empty password

  Scenario: Sign_up via empty login
    When Visitor clicks on 'Sign up'
    When Visitor tries to login with "" username and "qwertyQ1" password
    Then Visitor should see message about empty email

  Scenario: Sign_up via empty data
    When Visitor clicks on 'Sign up'
    When Visitor tries to login with "" username and "" password
    Then Visitor should see message about empty fields