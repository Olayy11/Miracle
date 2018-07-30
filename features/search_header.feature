Feature: Header Seacrh
 Background:
    Given I am on Outeast
    When I click on 'Sign in'
    When I login with "8@gmail.com" username and "qwertyQ1" password
    Then I successfully login

  Scenario: Search by 3 characters
    When I click on 'Search'
    When I start writing "cal"
    Then I should see all results with "cal"

  Scenario: Search by 3 characters (town)
    When I click on 'Search'
    When I start writing "Ama"
    Then I should see all results with "Ama" in town

  Scenario: Search by 3 numbers (addresses)
    When I click on 'Search'
    When I start writing "134"
    Then I should see all results with "134" in addresses

  Scenario: Results number of title the same as results
    When I click on 'Search'
    When I start writing "125"
    Then I should see results number of title the same as results

  Scenario: Results are not displayed if there are no result
    When I click on 'Search'
    When I start writing "blasblabla"
    Then I should see message about NO RESULTS


  Scenario: Direct from results page (address)
    When I click on 'Search'
    When I start writing "124"
    Then I should see all results with "124"
    Then I click any result
And I direct to SRP with selected "124" addresses
#
#  Scenario: Direct from results page (town)
#    When I click on 'Search'
#    When I start writing "134"
#    Then I click any result
#    And I direct to HDP page with this town
