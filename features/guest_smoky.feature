Feature: Smoky
   Background:
   Given Visitor is at Outeast
   And Visitor is guest

  Scenario: Search by Compact Search Bar - SALES
     When Visitor should see Sales is active
     Then Visitor selects town "Bridgehampton"
     Then Visitor selects min price 2000000 and max price 40000000
     Then Visitor selects beds "2"
     Then Visitor clicks SEE HOMES
     And Visitor should see all listings with "Bridgehampton" town - SEARCHBAR, TITLE,LISTINGS
     And Visitor should see all listings price between selected price min 2000000 and max 40000000
     And Visitor should see all listings from selected beds 2
     Then Visitor click next page if there is pagination
     And Visitor should see next page

  Scenario: Search by Compact Search Bar - RENTALS
    When Visitor should see Sales is active
    Then Visitor clicks Rentals
    And Visitor should see Rentals is active
    Then Visitor selects town "Bridgehampton"
    Then Visitor selects dates "June"
    Then Visitor selects min price 2000000 and max price 40000000
    Then Visitor selects beds "2"
    Then Visitor clicks SEE HOMES
    And Visitor should see all listings with "Bridgehampton" town - SEARCHBAR, TITLE,LISTINGS
    And Visitor should see all listings price between selected price min 200000 and max 40000000
    And Visitor should see selected dates "June"
    And Visitor should see all listings from selected beds 2

  Scenario: Listings Youll Love is shown
    When Visitor should see 4 Listings Youll Love
    Then Visitor clicks one of listings "You’ll Love"
    And Visitor should see page with listings

  Scenario: New to the Market is shown
    When Visitor should see "New to the Market" box
    Then Visitor clicks on < button for NEW
    Then Visitor clicks on > button for NEW
    Then Visitor clicks VIEW ALL
    And Visitor should see page All Hamptons Real Estate and sort by NEW

  Scenario: Trending Properties is shown
    When Visitor should see "Trending Properties" box
    Then Visitor clicks on < button for PROPERTTIES
    Then Visitor clicks on > button for PROPERTTIES

  Scenario: Guides from main page
    When Visitor should see 4 guides cards
    Then Visitor clicks "VIEW ALL GUIDES" and should see NEW TAB with url "/guides/"
    Then Visitor clicks on 1 of 4 Local Guides
    And Visitor should see page with this clicked guides

  Scenario: Stories from main page
    When Visitor see 3 stories cards
    Then Visitor clicks "VIEW MORE STORIES" and should see NEW TAB with url "/stories/"
    Then Visitor clicks on 1 of 3 stories
    And Visitor should see page with this clicked stories

  Scenario: Quick Links
    Then Visitor clicks SALES of footer
    And Visitor should see SALES pages
    Then Visitor backs to main page
    Then Visitor clicks RENTALS of footer
    And Visitor should see RENTALS pages
    Then Visitor backs to main page
    Then Visitor clicks LAND
    And Visitor should see LAND pages
    Then Visitor backs to main page
    Then Visitor clicks STORIES
    And Visitor should see STORIES pages
    Then Visitor clicks OPEN HOUSES
    And Visitor should see OPEN HOUSES pages and listings with labels
    Then Visitor click CAREERS
    And Visitor should see CAREERS pages
    Then Visitor goes back
    And Visitor should see PRESS with mailto

  Scenario: Social Links of footer
    Then Visitor clicks icon Instagram
    And Visitor should see Instagram pages
    Then Visitor goes back
    Then Visitor clicks icon FB
    And Visitor should see FB pages
    Then Visitor goes back
    Then Visitor clicks icon Twitter
    And Visitor should see Twitter pages

  Scenario: SALES - ADVANCED FILTERS
    When Visitor on Sales page
    Then Visitor clicks ADVANCED FILTERS
    And Visitor should see filter modal
    And Visitor should see that SALES is active
    Then Visitor selects town "Bridgehampton" in modal
    Then Visitor selects min price 200000 and max price 4000000 in modal
    Then Visitor selects bedrooms 3 in modal
    Then Visitor selects bathrooms 3 in modal
    Then Visitor selects acreage 1
    Then Visitor selects Estimated Sq. Ft. "1500"
    Then Visitor selects listing status "For Sale"
    Then Visitor selects view "Waterview"
   # Then Visitor selects and unselect amenities "Fireplace"
    Then Visitor clicks SEE RESULTS in modal
    And Visitor should see all listings with "Bridgehampton" town - SEARCHBAR, TITLE,LISTINGS
    And Visitor should see all listings price between selected price min 200000 and max 40000000
    And Visitor should see all listings from selected beds 3
    And Visitor should see all listings from selected baths "3"

  Scenario: RENTALS - ADVANCED FILTERS
    When Visitor on Rentals page
    Then Visitor clicks ADVANCED FILTERS
    And Visitor should see filter modal
    And Visitor should see that SALES is active
    Then Visitor selects town "Amagansett" in modal
    Then Visitor selects Rental Period "June" in modal
    Then Visitor selects min price 200000 and max price 4000000 in modal
    Then Visitor selects bedrooms 3 in modal
    Then Visitor selects bathrooms 3 in modal
    Then Visitor selects acreage 2
    Then Visitor selects Estimated Sq. Ft. "1500"
    Then Visitor selects listing status "Active"
    Then Visitor selects view "Waterview"
   #Then Visitor selects amenities "Fireplace"
    Then Visitor clicks SEE RESULTS in modal
    And Visitor should see No results

  Scenario: Save Search
  When Visitor on Rentals page
  Then Visitor clicks Save Search
  And  Visitor should see Registration form

  Scenario: Save listing
    When Visitor on Rentals page
    Then Visitor clicks Save listing
    And  Visitor should see Registration form

  Scenario: Actions from HDP
   When Visitor on Sales page
   Then Visitor clicks listing
   And Visitor should see listing page
   Then Visitor clicks Save
   And Visitor should see Registration form
   Then Visitor clicks CLOSE form
   Then Visitor clicks CONTACT AGENT
   And Visitor should see contact form
   Then Visitor clicks CLOSE contact form
   Then Visitor clicks SHARE
   And Visitor should see share form
   Then Visitor clicks CLOSE share form

  Scenario: Contact agent/HDP
    When Visitor on Sales page
    Then Visitor clicks listing
    Then Visitor clicks CONTACT AGENT
    Then Visitor fills name
    Then Visitor fills email
    Then Visitor fills phone
    Then Visitor fills message
    Then Visitor clicks SEND
    And Visitor should see "Message has been sent" message

  Scenario: Share listing/HDP
    When Visitor on Sales page
    Then Visitor clicks listing
    Then Visitor clicks SHARE
    Then Visitor fills email
    Then Visitor fills share with
    Then Visitor clicks SEND share
    And Visitor should see "This listing has been shared!" message

  Scenario: Slider/HDP
    When Visitor on Sales page
    Then Visitor clicks listing
    Then Visitor clicks > on main photo
    Then Visitor clicks < on main photo
    Then Visitor clicks > on the bottom,preview
    Then Visitor clicks < on the bottom,preview
    Then Visitor clicks map view
    Then Visitor closes map view
    Then Visitor clicks full screen photo
    And Visitor should see Lightbox

  Scenario: Lightbox/HDP
    When Visitor on Sales page
    Then Visitor clicks listing
    Then Visitor clicks full screen photo
    Then Visitor clicks lightbox Save
    And Visitor should see Registration form
    Then Visitor clicks CLOSE form
    Then Visitor clicks > on main photo
    Then Visitor clicks < on main photo
    Then Visitor clicks on preview
    Then Visitor clicks on map
    And Visitor should see MapView

  Scenario: Lightbox/SHARE
    When Visitor on Sales page
    Then Visitor clicks listing
    Then Visitor clicks full screen photo
    Then Visitor clicks lightbox SHARE
    Then Visitor fills email
    Then Visitor fills share with
    Then Visitor clicks SEND share
    And Visitor should see "This listing has been shared!" message

  Scenario: Lightbox/CONTACT AGENT
    When Visitor on Sales page
    Then Visitor clicks listing
    Then Visitor clicks full screen photo
    Then Visitor clicks lightbox CONTACT AGENT
    Then Visitor fills name
    Then Visitor fills email
    Then Visitor fills phone
    Then Visitor fills message
    Then Visitor clicks SEND
    And Visitor should see "Message has been sent" message

  Scenario: To Agent page
    When Visitor goes to HDP
    Then Visitor clicks agent link
    Then Visitor should be on agent page

  Scenario: Agent page actions
    When Visitor on Agent page
    Then Visitor clicks CONTACT AGENT
    And Visitor should see contact form
    Then Visitor clicks CLOSE modal
    Then Visitor clicks Show phone number
    And Visitor should see a number
    Then Visitor scrolls down
    And Visitor should see stiсky tab and Contact button
    Then Visitor clicks CONTACT AGENT stiсky
    And Visitor should see contact form
    Then Visitor clicks CLOSE modal

  Scenario: Agent page TABS
    When I'm on Agent page
    Then Visitor clicks Active Sales
    And Visitor should see Active Sales
    Then Visitor clicks Past Sales
    And Visitor should see Past Sales
    Then Visitor clicks Past Rentals
    And Visitor should see Past Rentals
    Then Visitor clicks Active Rentals
    And Visitor should see Active Rentals


