require_relative '../support/methods'
next_button =".SimpleSlider-control.SimpleSlider-control--next"
prev_button=".SimpleSlider-control.SimpleSlider-control--prev"
stiky_tab=".AgentPageTabs-item"
active_stiky_tab=".AgentPageTabs-item.isActive"

And (/^I am guest$/) do
 expect(page).to have_css(".Header-actionWrapper", text: 'Sign In')
end

And (/^I am registered$/) do
  find('div.Header-actionWrapper').find('a.Header-actionName:nth-child(2)').click
  email = FFaker::Internet.email
  fill_in 'email', with: email
  fill_in 'password', :with => "12345678"
  click_button 'Sign'
end


When /^I on main page$/ do
  visit "/"
end

When (/^I see Sales is active$/) do
 expect(page).to have_css(".CompactSearchBar-link.isActive", text: 'Sales')
end

Then (/^I select town "(.*?)"$/) do |town|
  find(".Multiselect-locations").click
  find(".Multiselect-options .Checkbox", :text => town).click
  sleep 0.3
end

Then("I select min price {int} and max price {int}") do |min_price, max_price|
  find(".CompactSearchBar-input--price").click
  7.times{find('.PriceInput-field:nth-child(2) .TextField').send_keys :backspace}
  fill_in "priceFrom", with:min_price
  fill_in "priceTo", with:max_price
end

#Then /^I select beds "(.*?)"$/ do |beds| if wanna use type data
 Then /^I select beds "2"$/ do
 find(".CompactSearchBar-input--beds").click
 find(".Button--iconPlus").click
# fill_in "beds", with:beds
 end

Then /^I click SEE HOMES$/ do
  click_button ("SEE HOMES")
end

Then /^I click 'All Guides'/ do
  find(".Button.Button--secondary", :text => "VIEW ALL GUIDES").click
end


And (/^I should see all listings with "(.*?)" town - SEARCHBAR, TITLE,LISTINGS$/) do |towns|
  expect(page).to have_css(".ListingGroup-headingBlock", text: towns)
  expect(page).to have_css(".SearchBar-section--towns", text: towns)
  expect(page).to have_css(".CardDesktop-region", text: towns.upcase)
end

And ("I should see all listings price between selected price min {int} and max {int}") do |min, max|
   check_betweenprice(min,max)
end

And ("I should see all listings from selected beds {int}") do |beds|
   check_beds (beds)
end

Then /^I click next page if there is pagination$/ do
  if expect(page).to have_css(".Button--iconRight")
    find(".Button--iconRight").click
    Capybara.default_max_wait_time
  else
    puts "only 1 page"
  end
end

And (/^I should see next page$/) do
  if expect(page).to have_css(".Button--iconLeft")
    expect(page).to have_css(".Pagination-info", :text => "2 /")
  else
    puts "oops! only 1 page"
  end
end

Then /^I click Rentals$/ do
  find(".CompactSearchBar-link--rentals").click
end

And /^I see Rentals is active$/ do
  expect(page).to have_css(".CompactSearchBar-link.isActive", text: 'Rentals')
end

Then /^I select dates "(.*?)"$/ do |date|
  find(".Select-selectedOption").click
  find(".Select-option", :exact_text => date).click
end

And (/^I should see selected dates "(.*?)"$/) do |dates|
  check_shot_dates (dates)
end

When ("I see {int} Listings Youll Love") do |number|
  selector = ".SecondaryPromoCard"
  number_cards(selector, number)
end

Then /^I click one of listings "You’ll Love"$/ do
  love_cards= page.all(".SecondaryPromoCard").count
  page.all('.SecondaryPromoCard-button')[rand(love_cards)].click #select random  and click it
end

And /^I should see page with listings$/ do
 # puts page.current_url
  expect(page).to have_css(".SearchBar")
  expect(page).to have_css(".Srp-section")
end

When /^I see "New to the Market" block$/ do
 expect(page).to have_css(".Home-sectionCloud", :text => "New to the Market")
end

Then /^I click on < button for NEW$/ do
  5.times {page.all(prev_button)[0].click}
end
Then /^I click on > button for NEW$/ do
  5.times {page.all(next_button)[0].click}
end

Then /^I click VIEW ALL$/ do
  find(".Link.Link--viewAll").click
  puts page.current_url
end

And /^I should see page All Hamptons Real Estate and sort by NEW$/ do
 curr_page ("/for-sale/order/newest")
end
When /^I see "Trending Properties" block$/ do
  expect(page).to have_css(".Home-sectionCloud", :text => "Trending Properties")
end

Then /^I click on < button for PROPERTTIES$/ do
  5.times {page.all(prev_button)[1].click}
end
Then /^I click on > button for PROPERTTIES$/ do
  5.times { page.all(next_button)[1].click }
end

When ("I see {int} guides cards") do |number|
 selector=".GuideCards .ImpressionCard-blocks"
 number_cards(selector, number)
end
When ("I see {int} stories cards") do |number|
   selector=".SimpleSlider-container .ImpressionCard-blocks"
   number_cards(selector, number)
end

Then (/^I click "(.*?)" and I see NEW TAB with url "(.*?)"$/) do |button_name, url|
  new_window = window_opened_by {custom_click_button(button_name)}
    within_window new_window do
      curr_page (url)
      puts page.current_url
      page.execute_script('window.close()') # close new page
      switch_to_window(windows.first)
      end
end
Then /^I click on 1 of 4 Local Guides$/ do
  guides= page.all(".GuideCards-card .ImpressionCard").count
  random_guide= page.all(".GuideCards-card .ImpressionCard")[rand(guides)]
  random_guide.click
  @title_guide = random_guide.text #for next step
end

And /^I should see page with this clicked guides$/ do
   new_window = windows.last
   within_window new_window do
   puts page.current_url
      array_words= @title_guide.split(/[^[[:word:]]]+/)
      # puts array_words[0] first word
      expect(page).to have_css(".guide-hero__title", :text =>array_words[0]) # title has first word from cards desc
   page.execute_script('window.close()') # close new page
   switch_to_window(windows.first)
   end
end
Then /^I click on 1 of 3 stories$/ do
  stories= page.all(".SimpleSlider-container .ImpressionCard-blocks").count
  random_storie= page.all(".SimpleSlider-container .ImpressionCard-blocks")[rand(stories)]
  random_storie.click
  @title_stories = random_storie.text #for next step
end
And /^I should see page with this clicked stories$/ do
  new_window = windows.last
  within_window new_window do
    puts page.current_url
    array_words= @title_stories.split(/[^[[:word:]]]+/)
    # puts array_words[0] first word
    expect(page).to have_css(".story-header__title", :text =>array_words[0]) # title has first word from cards desc
    page.execute_script('window.close()') # close new page
    switch_to_window(windows.first)
  end

end


Then /^I click SALES of footer$/ do
 footer_items("SALES")
end
And /^I should see SALES pages$/ do
   curr_page ("/for-sale")
end
Then /I click RENTALS of footer$/ do
  footer_items("RENTALS")
end
And /^I should see RENTALS pages$/ do
  curr_page ("/for-rent")
end
Then /^I click LAND$/ do
 footer_items("LAND")
end
And /^I should see LAND pages$/ do
  curr_page ("/for-sale/land")
end
Then /^I click STORIES$/ do
  footer_items("STORIES")
end
And /^I should see STORIES pages$/ do
  curr_page ("/stories")
end
Then /^I click OPEN HOUSES$/ do
  footer_items("OPEN HOUSES")
end
And /^I should see OPEN HOUSES pages and listings with labels$/ do
  curr_page ("/for-sale/open-house/true")
end
Then /^I click CAREERS$/ do
  footer_items("CAREERS")
end
And /^I should see CAREERS pages$/ do
  another_page ("https://streeteasy.com/jobs")
end

And /^I should see PRESS with mailto$/ do
  expect(page).to have_selector(:css, 'a[href="mailto:press@outeast.com"]')
end
Then /^I go back$/ do
  page.go_back
  sleep 2
end
Then /^I back to main page$/ do
  find(".Header-logoContainer").click
end

Then /^I click icon Instagram$/ do
  page.all(".Footer-socialLink")[0].click
end
And /^I should see Instagram pages$/ do
  another_page ("https://www.instagram.com/headouteast/")
end
Then /^I click icon FB$/ do
  page.all(".Footer-socialLink")[1].click
end
And /^I should see FB pages$/ do
  another_page ("https://www.facebook.com/headouteast")
end
Then /^I click icon Twitter$/ do
  page.all(".Footer-socialLink")[2].click
end
And /^I should see Twitter pages$/ do
  another_page ("https://twitter.com/outeast")
end

When (/^I go to Sales page$/) do
  visit '/for-sale'
end

Then /^I click SEE RESULTS$/ do
  find(".SearchBarFooterActions-action", :text => "SEE RESULTS").click
 end

Then /^I click ADVANCED FILTERS$/ do
  find(".AdvancedFilter", :text=>"ADVANCED FILTERS" ).click
end

And /^I should see filter modal$/ do
  expect(page).to have_selector(:css, ".AdvancedFilter-modal")
end

And /^I should see that SALES is active$/ do
  expect(page).to have_selector(:css, ".AdvancedFilter-modalHeader-link.isActive")
end

# FILTER MODAL
Then (/^I select bedrooms "(.*?)"$/) do |bedrooms|
  find(".Label.Label--inline", :text => "Bedrooms").(".Button--iconPlus").click
end
Then (/^I select town "(.*?)" in modal$/) do |town|
  find(".ListingForm-anchor .Multiselect-locations").click
  find(".Multiselect-options .Checkbox", :text => town).click
end

Then ("I select min price {int} and max price {int} in modal") do |min_price, max_price|
  8.times{find('.PriceInput-field:nth-child(2) .TextField').send_keys :backspace}
  fill_in "priceFrom", with:min_price
  fill_in "priceTo", with:max_price
end
Then ("I select bedrooms {int} in modal") do  |bedrooms|
  beds=bedrooms-1
  beds.times {find(".ListingForm-input[data-qa-advanced-beds-input] .Button--iconPlus").click}
  end
Then ("I select bathrooms {int} in modal") do |bathrooms|
  bath=bathrooms-1
  bath.times { find(".ListingForm-input[data-qa-advanced-baths-input] .Button--iconPlus").click}
end
Then ("I select acreage {int}") do |acreage|
  numb= 10-acreage
  numb.times {find(".ListingForm-input[data-qa-advanced-acr-input] .Button--iconMinus").click}
end
Then (/^I select Estimated Sq. Ft. "1500"$/) do
  2.times {find(".ListingForm-input[data-qa-advanced-sqft-input] .Button--iconPlus").click}
end
Then (/^I select listing status "(.*?)"$/) do |status|
  find(".CheckySelect-selectedOptionText", :text => status).click
  2.times {find(".CheckySelect-optionText", :text => status).click}
end
Then (/^I select view "(.*?)"$/) do |view|
  find(".ListingForm-input[data-qa-advanced-view-checkbox]").click
  3.times {find(".CheckySelect-optionText", :text => view).click}
  find(".ListingForm-input[data-qa-advanced-view-checkbox]").click
 end
Then (/^I select and unselect amenities "(.*?)"$/) do |amenities|
  2.times {find(".ListingForm-input--checkbox", :text => amenities).click}
end
Then /^I click SEE RESULTS in modal$/ do
  find(".AdvancedFilter-modalFooter-button", :text => "SEE RESULTS").click

end
Then (/^I select Rental Period "(.*?)" in modal$/) do |period|
find(".ListingForm-input--fullWidth[data-qa-advanced-rental-period-input]").click
find(".Select-option", :exact_text => period).click
end

###
And (/^I should see all listings from selected baths "(.*?)"$/) do |baths|
  expect(page).to have_css(".SearchBar-section[data-qa-searchbar-beds-baths-input]", :text => baths+"+ BA")
end
When /^I go to Rentals page$/ do
  visit '/for-rent'
end
And /^I should see No results$/ do
  expect(page).to have_css(".ListingGroup-empty",:text => "Your search returned no results.")
end

Then /^I click Save Search$/ do
  find(".Button", :text => "SAVE SEARCH").click
end

And  /^I should see Registration form$/ do
  expect(page).to have_css(".Form-wrap--extraSpace", :text => "Sign in to your Out East account")

end

 Then /^I click Save listing$/ do
   page.all(".Button--saveLink[data-save-listing-button]")[1].click
 end
#HDP
Then /^I click listing$/ do
  click_any_listing(".CardDesktop")
end
And /^I should see listing page$/ do
  expect(page).to have_css(".Hdp")
end

Then /^I click Save$/ do
  find("a.Button.Button--save", :text => "SAVE").click
end
Then /^I click CLOSE form$/ do
  find(".Modal-close").click
end

Then /^I click CONTACT AGENT$/ do
  find("a.Button.Button--primary", :text => "CONTACT AGENT").click
end

And /^I should see contact form$/ do
  expect(page).to have_css(".ContactAgentForm")
end
Then /^I click CLOSE contact form$/ do
  find(".ContactAgentForm-closeButton").click
end
Then /^I fill name$/ do
  name = FFaker::Name.name
  fill_in 'name', :with => name
end
Then /^I fill email$/ do
  email = FFaker::Internet.email
  fill_in 'email', :with => email
end
Then /^I fill phone$/ do
  phone =FFaker::PhoneNumber.phone_number
  fill_in 'phone', :with => phone
end
Then /^I fill message$/ do
  fill_in 'message', :with => 'Some message to agent'
end
Then /^I click SEND$/ do
  click_button "Send"
end
And /^I should see "Message has been sent"$/ do
  expect(page).to have_css(".InfoBar-content", :text => "Message has been sent")
end
Then /^I click SHARE$/ do
  find(".Button--iconShare").click
end
And /^I should see share form$/ do
  expect(page).to have_css(".ShareListing")
end
Then /^I click CLOSE share form$/ do
  find(".Modal-close").click
end
Then /^I fill share with$/ do
  sh_email = FFaker::Internet.email
  fill_in 'recipientEmail', :with => sh_email
end
Then /^I click SEND share$/ do
  click_button "Send request"
end
And /^I should see "This listing has been shared!"$/ do
  expect(page).to have_css(".InfoBar-content", :text => "This listing has been shared!")
end
Then /^If I see VIEW FULL HISTORY, I click it$/ do
 if find(".ToggabeText--table .ToggabeText-button", :visible =>true)
   find(".ToggabeText-button", :text => "VIEW FULL HISTORY +").click
   expect(page).to have_css(".ToggabeText--table", :visible =>false)
 else
   puts"no more"
 end
  puts page.current_url
end

#Slider
Then /^I click < on main photo$/ do
 2.times{find(".PhotoSlider .slick-arrow.slick-prev").click}
end
Then /^I click > on main photo$/ do
  2.times{find(".PhotoSlider .slick-arrow.slick-next").click}
end
Then /^I click > on the bottom,preview$/ do
  2.times{find(".Carousel .slick-arrow.slick-next").click}
end
Then /^I click < on the bottom,preview$/ do
  2.times{find(".Carousel .slick-arrow.slick-prev").click}
end
Then /^I click map view$/ do
find(".MapButton").click
end
Then /^I close map view$/ do
  find(".RoundCloseButton").click
end
Then /^I click full screen photo$/ do
  find(".PhotoSlider-expandButton").click
end
And /^I should see Lightbox$/ do
  expect(page).to have_css(".LightBox")
end

#lightbox
Then /^I click lightbox Save$/ do
  find("a.Button--iconHeartWhite", :text => "SAVE").click
end
Then /^I click lightbox SHARE$/ do
  find(".Button--iconShareWhite").click
end
Then /^I click lightbox CONTACT AGENT$/ do
  find(".LightBox-button").click
end
Then /^I click on preview$/ do
  page.all(".Carousel-image")[0].click
end

Then /^I click on map$/ do
  find(".MapButton.MapButton--lightBox").click
end

And /^I should see MapView$/ do
  expect(page).to have_css(".MapView.MapView--lightBox")
end

#Authorized
And /^I should see SAVED search$/ do
  expect(page).to have_css(".SearchBar .Button--primary", :text => "SAVED")
  sleep 0.3
end

Then /^I click SAVED$/ do
  find(".SearchBar .Button--primary", :text => "SAVED").click
end
And  /^I should see SAVE search$/ do
  expect(page).to have_css(".SearchBar .Button--primary", :text => "SAVE SEARCH")
  sleep 0.3
end

Then /^I should see saved listing hdp$/ do
  expect(page).to have_css(".Button.Button--save.isActive", :text => "SAVED")
end
Then /^I click SAVED hdp$/ do
  find(".Button.Button--save.isActive", :text => "SAVED").click
end

And  /^I should see save listing$/ do
   expect(page).to have_css(".Button--saveLink[data-save-listing-button]:nth-child(1)", :text => "SAVE")
 end

When /^I go to HDP$/ do
  visit "properties/sales/12921"
end
Then /^I click agent link$/ do
  agent_link= page.all(".AgentBox-fullName a").count
  page.all(".AgentBox-fullName a")[rand(agent_link)].click
end
Then /^I should be on agent page$/ do
expect(page).to have_css(".AgentPage")
end

#Agent page
When /^I'm on Agent page$/ do
  visit "/agents/1057/susan-ryan/east-hampton"
end
Then /^I click Show phone number$/ do
find(".AgentProfile-contactPhoneButtonText", :text => "Show phone number").click
end
And /^I should see a number$/ do
  expect(page).to have_css(".AgentProfile-contactPhonesContainer.isActive")
end
Then /^I click CLOSE modal$/ do
  page.all(".Modal-close")[2].click
end
Then /^I click Active Sales$/ do
  find(stiky_tab, :text => "Active Sales").click
end
Then /^I click Past Sales$/ do
  find(stiky_tab, :text => "Past Sales").click
end
Then /^I click Past Rentals$/ do
  find(stiky_tab, :text => "Past Rentals").click
end
Then /^I click Active Rentals$/ do
  find(stiky_tab, :text => "Active Rentals").click
end
And /^I should see Active Sales$/ do
  expect(page).to have_css(active_stiky_tab, :text => "Active Sales")
end
And /^I should see Past Sales$/ do
  expect(page).to have_css(active_stiky_tab, :text => "Past Sales")
end
And /^I should see Past Rentals$/ do
  expect(page).to have_css(active_stiky_tab, :text => "Past Rentals")
end
And /^I should see Active Rentals$/ do
  expect(page).to have_css(active_stiky_tab, :text => "Active Rentals")
end
Then /^I scroll down$/ do
  page.execute_script "window.scrollBy(0,3000)"
  sleep 2
  end
And /^I should see stiсky tab and Contact button$/ do
expect(page).to have_css(".AgentProfile--stickedOnTop")
expect(page).to have_css(".AgentPageTabs-agentProfileRight.isTabsSticky")
end

Then /^I click CONTACT AGENT stiсky$/ do
  find(".AgentPageTabs-agentProfileRight.isTabsSticky", :text => "CONTACT AGENT").click
end
Then /^I click any listing$/ do
# cards=page.all(".ListingGroup-cards .CardDesktop").count
# page.all(".ListingGroup-cards .CardDesktop")[rand(cards)].click
click_any_listing(".ListingGroup-cards .CardDesktop")
end
And /^I should see HDP$/ do
  expect(page).to have_css(".Hdp")
end
Then (/^I click "(.*?)" listing, I should see "(.*?)"$/) do |action, result|
  random_listing=page.all(".CardDesktop-action", :exact_text =>action).count
  #puts random_listing
  listing = page.all(".CardDesktop-action", :exact_text =>action)[rand(random_listing)]
  listing.click
  sleep 2
  #puts listing.text
  if listing.text == result
    res=true
  else
    res=false
  end
  expect(res).to be true
  sleep 4
  end

And (/^I should see "(.*?)" on the map$/) do |action|
  custom_expect (action)
  page.execute_script "window.scrollTo(0,0)"
  sleep 5
end

Then (/^I click "SAVED preview" preview on the map$/) do
  find(".CardPreview .Button.Button--saveLink.isActive").click
end
Then (/^I click "SAVE preview" preview on the map$/) do
  find(".CardPreview .Button.Button--saveLink").click
end
Then (/^I click review on the map$/) do
  find(".CardPreview").click
end