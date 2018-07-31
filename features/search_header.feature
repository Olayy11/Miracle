Feature: Header Seacrh
 Background:
    Given I am on Outeast
     And I logged

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
    And I direct to SRP with selected "124" in addresses title

  Scenario: Direct from results page (town)
    When I click on 'Search'
    When I start writing "cal"
    Then I should see all results with "cal"
    Then I click any result
    And I direct to HDP page with selected "" in addresses town

  Scenario: Search by 2spaces
    When I click on 'Search'
    When I start writing "  "
    Then I should see search page without changing

  Scenario: Close search icon (main page)
    When I click on 'Search'
    Then I click on 'X'
    Then I should see main page

  Scenario: Close search icon (rental page)
    When I click Rental
    When I click on 'Search'
    Then I click on 'X'
    Then I should see rental page

  Scenario: Close search icon (sales page)
    When I click Sales
    When I click on 'Search'
    Then I click on 'X'
    Then I should see sales page

  Scenario: Direct to recently view from search
    When I click Sales item
    When I click on 'Search'
    Then I see recently viewed
    And Price of clicked Sales item and recently viewed are identical