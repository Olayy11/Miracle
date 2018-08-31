Feature: Smoky
   Background:
   Given I am on Outeast
   And I am guest

  Scenario: Search by Compact Search Bar - SALES
     When I see Sales is active
     Then I select town "Bridgehampton"
     Then I select min price 2000000 and max price 40000000
     Then I select beds "2"
     Then I click SEE HOMES
     And I should see all listings with "Bridgehampton" town - SEARCHBAR, TITLE,LISTINGS
     And I should see all listings price between selected price min 2000000 and max 40000000
     And I should see all listings from selected beds 2
     Then I click next page if there is pagination
     And I should see next page

  Scenario: Search by Compact Search Bar - RENTALS
    When I see Sales is active
    Then I click Rentals
    And I see Rentals is active
    Then I select town "Bridgehampton"
    Then I select dates "June"
    Then I select min price 2000000 and max price 40000000
    Then I select beds "2"
    Then I click SEE HOMES
    And I should see all listings with "Bridgehampton" town - SEARCHBAR, TITLE,LISTINGS
    And I should see all listings price between selected price min 200000 and max 40000000
    And I should see selected dates "June"
    And I should see all listings from selected beds 2

  Scenario: Listings Youll Love is shown
    When I see 4 Listings Youll Love
    Then I click one of listings "You’ll Love"
    And I should see page with listings

  Scenario: New to the Market is shown
    When I see "New to the Market" block
    Then I click on < button for NEW
    Then I click on > button for NEW
    Then I click VIEW ALL
    And I should see page All Hamptons Real Estate and sort by NEW

  Scenario: Trending Properties is shown
    When I see "Trending Properties" block
    Then I click on < button for PROPERTTIES
    Then I click on > button for PROPERTTIES

  Scenario: Guides from main page
    When I see 4 guides cards
    Then I click "VIEW ALL GUIDES" and I see NEW TAB with url "/guides/"
    Then I click on 1 of 4 Local Guides
    And I should see page with this clicked guides

  Scenario: Stories from main page
    When I see 3 stories cards
    Then I click "VIEW MORE STORIES" and I see NEW TAB with url "/stories/"
    Then I click on 1 of 3 stories
    And I should see page with this clicked stories

  Scenario: Quick Links
    Then I click SALES of footer
    And I should see SALES pages
    Then I back to main page
    Then I click RENTALS of footer
    And I should see RENTALS pages
    Then I back to main page
    Then I click LAND
    And I should see LAND pages
    Then I back to main page
    Then I click STORIES
    And I should see STORIES pages
    Then I click OPEN HOUSES
    And I should see OPEN HOUSES pages and listings with labels
    Then I click CAREERS
    And I should see CAREERS pages
    Then I go back
    And I should see PRESS with mailto

  Scenario: Social Links of footer
    Then I click icon Instagram
    And I should see Instagram pages
    Then I go back
    Then I click icon FB
    And I should see FB pages
    Then I go back
    Then I click icon Twitter
    And I should see Twitter pages

  Scenario: SALES - ADVANCED FILTERS
    When I go to Sales page
    Then I click ADVANCED FILTERS
    And I should see filter modal
    And I should see that SALES is active
    Then I select town "Bridgehampton" in modal
    Then I select min price 200000 and max price 4000000 in modal
    Then I select bedrooms 3 in modal
    Then I select bathrooms 3 in modal
    Then I select acreage 1
    Then I select Estimated Sq. Ft. "1500"
    Then I select listing status "For Sale"
    Then I select view "Waterview"
   # Then I select and unselect amenities "Fireplace"
    Then I click SEE RESULTS in modal
    And I should see all listings with "Bridgehampton" town - SEARCHBAR, TITLE,LISTINGS
    And I should see all listings price between selected price min 200000 and max 40000000
    And I should see all listings from selected beds 3
    And I should see all listings from selected baths "3"

  Scenario: RENTALS - ADVANCED FILTERS
    When I go to Rentals page
    Then I click ADVANCED FILTERS
    And I should see filter modal
    And I should see that SALES is active
    Then I select town "Amagansett" in modal
    Then I select Rental Period "June" in modal
    Then I select min price 200000 and max price 4000000 in modal
    Then I select bedrooms 3 in modal
    Then I select bathrooms 3 in modal
    Then I select acreage 2
    Then I select Estimated Sq. Ft. "1500"
    Then I select listing status "Active"
    Then I select view "Waterview"
   #Then I select amenities "Fireplace"
    Then I click SEE RESULTS in modal
    And I should see No results

  Scenario: Save Search
  When I go to Rentals page
  Then I click Save Search
  And  I should see Registration form

  Scenario: Save listing
    When I go to Rentals page
    Then I click Save listing
    And  I should see Registration form

  Scenario: Actions from HDP
   When I go to Sales page
   Then I click listing
   And I should see listing page
   Then I click Save
   And I should see Registration form
   Then I click CLOSE form
   Then I click CONTACT AGENT
   And I should see contact form
   Then I click CLOSE contact form
   Then I click SHARE
   And I should see share form
   Then I click CLOSE share form

  Scenario: Contact agent/HDP
    When I go to Sales page
    Then I click listing
    Then I click CONTACT AGENT
    Then I fill name
    Then I fill email
    Then I fill phone
    Then I fill message
    Then I click SEND
    And I should see "Message has been sent"

  Scenario: Share listing/HDP
    When I go to Sales page
    Then I click listing
    Then I click SHARE
    Then I fill email
    Then I fill share with
    Then I click SEND share
    And I should see "This listing has been shared!"

  Scenario: Slider/HDP
    When I go to Sales page
    Then I click listing
    Then I click > on main photo
    Then I click < on main photo
    Then I click > on the bottom,preview
    Then I click < on the bottom,preview
    Then I click map view
    Then I close map view
    Then I click full screen photo
    And I should see Lightbox

  Scenario: Lightbox/HDP
    When I go to Sales page
    Then I click listing
    Then I click full screen photo
    Then I click lightbox Save
    And I should see Registration form
    Then I click CLOSE form
    Then I click > on main photo
    Then I click < on main photo
    Then I click on preview
    Then I click on map
    And I should see MapView

  Scenario: Lightbox/SHARE
    When I go to Sales page
    Then I click listing
    Then I click full screen photo
    Then I click lightbox SHARE
    Then I fill email
    Then I fill share with
    Then I click SEND share
    And I should see "This listing has been shared!"

  Scenario: Lightbox/CONTACT AGENT
    When I go to Sales page
    Then I click listing
    Then I click full screen photo
    Then I click lightbox CONTACT AGENT
    Then I fill name
    Then I fill email
    Then I fill phone
    Then I fill message
    Then I click SEND
    And I should see "Message has been sent"

  Scenario: To Agent page
    When I go to HDP
    Then I click agent link
    Then I should be on agent page

  Scenario: Agent page actions
    When I'm on Agent page
    Then I click CONTACT AGENT
    And I should see contact form
    Then I click CLOSE modal
    Then I click Show phone number
    And I should see a number
    Then I scroll down
    And I should see stiсky tab and Contact button
    Then I click CONTACT AGENT stiсky
    And I should see contact form
    Then I click CLOSE modal

  Scenario: Agent page TABS
    When I'm on Agent page
    Then I click Active Sales
    And I should see Active Sales
    Then I click Past Sales
    And I should see Past Sales
    Then I click Past Rentals
    And I should see Past Rentals
    Then I click Active Rentals
    And I should see Active Rentals


