Feature: Header Seacrh
 Background:
    Given Visitor is at Outeast
     And Visitor is guest

  Scenario: Search by 3 characters
    When Visitor clicks on 'Search'
    When Visitor starts writing "cal"
    Then Visitor should see all results with "cal"

  Scenario: Search by 3 characters (town)
    When Visitor clicks on 'Search'
    When Visitor starts writing "Ama"
    Then Visitor should see all results with "Ama" in town

  Scenario: Search by 3 numbers (addresses)
    When Visitor clicks on 'Search'
    When Visitor starts writing "134"
    Then Visitor should see all results with "134" in addresses

  Scenario: Results number of title the same as results
    When Visitor clicks on 'Search'
    When Visitor starts writing "125"
    Then Visitor should see results number of title the same as results

  Scenario: Results are not displayed if there are no result
    When Visitor clicks on 'Search'
    When Visitor starts writing "blasblabla"
    Then Visitor should see message about NO RESULTS


  Scenario: Direct from results page (address)
    When Visitor clicks on 'Search'
    When Visitor starts writing "124"
    Then Visitor should see all results with "124"
    Then Visitor clicks any result
    And Visitor directs to SRP with selected "124" in addresses title

  Scenario: Direct from results page (town)
    When Visitor clicks on 'Search'
    When Visitor starts writing "cal"
    Then Visitor should see all results with "cal"
    Then Visitor clicks any result
    And Visitor directs to HDP page with selected "" in addresses town

  Scenario: Search by 2spaces
    When Visitor clicks on 'Search'
    When Visitor starts writing "  "
    Then Visitor should see search page without changing

  Scenario: Close search icon (main page)
    When Visitor clicks on 'Search'
    Then Visitor clicks on 'X'
    Then Visitor should see main page

  Scenario: Close search icon (rental page)
    When Visitor clicks Rental
    When Visitor clicks on 'Search'
    Then Visitor clicks on 'X'
    Then Visitor should see rental page

  Scenario: Close search icon (sales page)
    When Visitor clicks Sales
    When Visitor clicks on 'Search'
    Then Visitor clicks on 'X'
    Then Visitor should see sales page

  Scenario: Direct to recently view from search
    When Visitor clicks Sales item
    When Visitor clicks on 'Search'
    Then Visitor should see recently viewed
    And Visitor should see that price of clicked Sales item and recently viewed are identical