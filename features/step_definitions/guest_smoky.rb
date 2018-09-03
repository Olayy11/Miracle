require_relative '../support/methods'
next_button =".SimpleSlider-control.SimpleSlider-control--next"
prev_button=".SimpleSlider-control.SimpleSlider-control--prev"
stiky_tab=".AgentPageTabs-item"
active_stiky_tab=".AgentPageTabs-item.isActive"

And (/^I am registered$/) do
  find('div.Header-actionWrapper').find('a.Header-actionName:nth-child(2)').click
  email = FFaker::Internet.email
  fill_in 'email', with: email
  fill_in 'password', :with => "12345678"
  click_button 'Sign'
end


And (/^Visitor is guest$/) do
 expect(page).to have_css(".Header-actionWrapper", text: 'Sign In')
end



When /^I on main page$/ do
  visit "/"
end

When (/^(.+) should see Sales is active$/) do |role|
 expect(page).to have_css(".CompactSearchBar-link.isActive", text: 'Sales')
end

Then (/^(.+) selects town "(.*?)"$/) do |role, town|
  find(".Multiselect-locations").click
  find(".Multiselect-options .Checkbox", :text => town).click
  sleep 0.3
end

Then(/^(.+) selects min price (\d+) and max price (\d+)$/) do |role, min_price, max_price|
  find(".CompactSearchBar-input--price").click
  7.times{find('.PriceInput-field:nth-child(2) .TextField').send_keys :backspace}
  fill_in "priceFrom", with:min_price
  fill_in "priceTo", with:max_price
end

#Then /^I select beds "(.*?)"$/ do |beds| if wanna use type data
 Then /^(.+) selects beds "2"$/ do |role|
 find(".CompactSearchBar-input--beds").click
 find(".Button--iconPlus").click
# fill_in "beds", with:beds
 end

Then /^(.+) clicks SEE HOMES$/ do |role|
  click_button ("SEE HOMES")
end

Then /^I click 'All Guides'/ do
  find(".Button.Button--secondary", :text => "VIEW ALL GUIDES").click
end


And (/^(.+) should see all listings with "(.*?)" town - SEARCHBAR, TITLE,LISTINGS$/) do |role, towns|
  expect(page).to have_css(".ListingGroup-headingBlock", text: towns)
  expect(page).to have_css(".SearchBar-section--towns", text: towns)
  expect(page).to have_css(".CardDesktop-region", text: towns.upcase)
end

And (/^(.+) should see all listings price between selected price min (\d+) and max (\d+)$/) do |role, min, max|
   check_betweenprice(min,max)
end

And (/^(.+) should see all listings from selected beds (\d+)$/) do |role, beds|
   check_beds (beds)
end

Then /^(.+) click next page if there is pagination$/ do |role|
  if expect(page).to have_css(".Button--iconRight")
    find(".Button--iconRight").click
    Capybara.default_max_wait_time
  else
    puts "only 1 page"
  end
end

And (/^(.+) should see next page$/) do |role|
  if expect(page).to have_css(".Button--iconLeft")
    expect(page).to have_css(".Pagination-info", :text => "2 /")
  else
    puts "oops! only 1 page"
  end
end

Then /^(.+) clicks Rentals$/ do |role|
  find(".CompactSearchBar-link--rentals").click
end

And /^(.+) should see Rentals is active$/ do |role|
  expect(page).to have_css(".CompactSearchBar-link.isActive", text: 'Rentals')
end

Then /^(.+) selects dates "(.*?)"$/ do |role, date|
  find(".Select-selectedOption").click
  find(".Select-option", :exact_text => date).click
end

And (/^(.+) should see selected dates "(.*?)"$/) do |role, dates|
  check_shot_dates (dates)
end

When (/^(.+) should see (\d+) Listings Youll Love$/) do |role, number|
  selector = ".SecondaryPromoCard"
  number_cards(selector, number)
end

Then /^(.+) clicks one of listings "You’ll Love"$/ do |role|
  love_cards= page.all(".SecondaryPromoCard").count
  page.all('.SecondaryPromoCard-button')[rand(love_cards)].click #select random  and click it
end

And /^(.+) should see page with listings$/ do |role|
 # puts page.current_url
  expect(page).to have_css(".SearchBar")
  expect(page).to have_css(".Srp-section")
end
=begin
# When /^(.+) should see "(.*?)" blockss$/ do |role, block|
#  expect(page).to have_css(".Home-sectionCloud", :text => block)
# end
=end
Then /^(.+) clicks on < button for NEW$/ do |role|
  5.times {page.all(prev_button)[0].click}
end
Then /^(.+) clicks on > button for NEW$/ do |role|
  5.times {page.all(next_button)[0].click}
end

Then /^(.+) clicks VIEW ALL$/ do |role|
  find(".Link.Link--viewAll").click
  puts page.current_url
end

And /^(.+) should see page All Hamptons Real Estate and sort by NEW$/ do |role|
 curr_page ("/for-sale/order/newest")
end
When /^(.+) should see "(.*?)" box$/ do |role, block|
  expect(page).to have_css(".Home-sectionCloud", :text => block)
end

Then /^(.+) clicks on < button for PROPERTTIES$/ do |role|
  5.times {page.all(prev_button)[1].click}
end
Then /^(.+) clicks on > button for PROPERTTIES$/ do |role|
  5.times { page.all(next_button)[1].click }
end

When (/^(.+) should see (\d+) guides cards$/) do |role, number|
 selector=".GuideCards .ImpressionCard-blocks"
 number_cards(selector, number)
end
When (/^(.+) see (\d+) stories cards$/) do |role, number|
   selector=".SimpleSlider-container .ImpressionCard-blocks"
   number_cards(selector, number)
end

Then (/^(.+) clicks "(.*?)" and should see NEW TAB with url "(.*?)"$/) do |role, button_name, url|
  new_window = window_opened_by {custom_click_button(button_name)}
    within_window new_window do
      curr_page (url)
      puts page.current_url
      page.execute_script('window.close()') # close new page
      switch_to_window(windows.first)
      end
end
Then /^(.+) clicks on 1 of 4 Local Guides$/ do |role|
  guides= page.all(".GuideCards-card .ImpressionCard").count
  random_guide= page.all(".GuideCards-card .ImpressionCard")[rand(guides)]
  random_guide.click
  @title_guide = random_guide.text #for next step
end

And /^(.+) should see page with this clicked guides$/ do |role|
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
Then /^(.+) clicks on 1 of 3 stories$/ do |role|
  stories= page.all(".SimpleSlider-container .ImpressionCard-blocks").count
  random_storie= page.all(".SimpleSlider-container .ImpressionCard-blocks")[rand(stories)]
  random_storie.click
  @title_stories = random_storie.text #for next step
end
And /^(.+) should see page with this clicked stories$/ do |role|
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

Then /^(.+) clicks SALES of footer$/ do |role|
 footer_items("SALES")
end
And /^(.+) should see SALES pages$/ do |role|
   curr_page ("/for-sale")
end
Then /(.+) clicks RENTALS of footer$/ do |role|
  footer_items("RENTALS")
end
And /^(.+) should see RENTALS pages$/ do |role|
  curr_page ("/for-rent")
end
Then /^(.+) clicks LAND$/ do |role|
 footer_items("LAND")
end
And /^(.+) should see LAND pages$/ do |role|
  curr_page ("/for-sale/land")
end
Then /^(.+) clicks STORIES$/ do |role|
  footer_items("STORIES")
end
And /^(.+) should see STORIES pages$/ do |role|
  curr_page ("/stories")
end
Then /^(.+) clicks OPEN HOUSES$/ do |role|
  footer_items("OPEN HOUSES")
end
And /^(.+) should see OPEN HOUSES pages and listings with labels$/ do |role|
  curr_page ("/for-sale/open-house/true")
end
Then /^(.+) click CAREERS$/ do |role|
  footer_items("CAREERS")
end
And /^(.+) should see CAREERS pages$/ do |role|
  another_page ("https://streeteasy.com/jobs")
end

And /^(.+) should see PRESS with mailto$/ do |role|
  expect(page).to have_selector(:css, 'a[href="mailto:press@outeast.com"]')
end
Then /^(.+) goes back$/ do |role|
  page.go_back
  sleep 2
end
Then /^(.+) backs to main page$/ do |role|
  find(".Header-logoContainer").click
end

Then /^(.+) clicks icon Instagram$/ do |role|
  page.all(".Footer-socialLink")[0].click
end
And /^(.+) should see Instagram pages$/ do |role|
  another_page ("https://www.instagram.com/headouteast/")
end
Then /^(.+) clicks icon FB$/ do |role|
  page.all(".Footer-socialLink")[1].click
end
And /^(.+) should see FB pages$/ do |role|
  another_page ("https://www.facebook.com/headouteast")
end
Then /^(.+) clicks icon Twitter$/ do |role|
  page.all(".Footer-socialLink")[2].click
end
And /^(.+) should see Twitter pages$/ do |role|
  another_page ("https://twitter.com/outeast")
end

When (/^(.+) on Sales page$/) do |role|
  visit '/for-sale'
end

Then /^(.+) clicks SEE RESULTS$/ do |role|
  find(".SearchBarFooterActions-action", :text => "SEE RESULTS").click
 end

Then /^(.+) clicks ADVANCED FILTERS$/ do |role|
  find(".AdvancedFilter", :text=>"ADVANCED FILTERS" ).click
end

And /^(.+) should see filter modal$/ do |role|
  expect(page).to have_selector(:css, ".AdvancedFilter-modal")
end

And /^(.+) should see that SALES is active$/ do |role|
  expect(page).to have_selector(:css, ".AdvancedFilter-modalHeader-link.isActive")
end

# FILTER MODAL
Then (/^(.+) selects bedrooms "(.*?)"$/) do |role, bedrooms|
  find(".Label.Label--inline", :text => "Bedrooms").(".Button--iconPlus").click
end
Then (/^(.+) selects town "(.*?)" in modal$/) do |role, town|
  find(".ListingForm-anchor .Multiselect-locations").click
  find(".Multiselect-options .Checkbox", :text => town).click
end

Then (/^(.+) selects min price (\d+) and max price (\d+) in modal$/) do |role, min_price, max_price|
  8.times{find('.PriceInput-field:nth-child(2) .TextField').send_keys :backspace}
  fill_in "priceFrom", with:min_price
  fill_in "priceTo", with:max_price
end
Then (/^(.+) selects bedrooms (\d+) in modal$/) do  |role, bedrooms|
  beds=bedrooms-1
  beds.times {find(".ListingForm-input[data-qa-advanced-beds-input] .Button--iconPlus").click}
  end
Then (/^(.+) selects bathrooms (\d+) in modal$/) do |role, bathrooms|
  bath=bathrooms-1
  bath.times { find(".ListingForm-input[data-qa-advanced-baths-input] .Button--iconPlus").click}
end
Then (/^(.+) selects acreage (\d+)$/) do |role, acreage|
  numb= 10-acreage
  numb.times {find(".ListingForm-input[data-qa-advanced-acr-input] .Button--iconMinus").click}
end
Then (/^(.+) selects Estimated Sq. Ft. "1500"$/) do |role|
  2.times {find(".ListingForm-input[data-qa-advanced-sqft-input] .Button--iconPlus").click}
end
Then (/^(.+) selects listing status "(.*?)"$/) do |role, status|
  find(".CheckySelect-selectedOptionText", :text => status).click
  2.times {find(".CheckySelect-optionText", :text => status).click}
end
Then (/^(.+) selects view "(.*?)"$/) do |role, view|
  find(".ListingForm-input[data-qa-advanced-view-checkbox]").click
  3.times {find(".CheckySelect-optionText", :text => view).click}
  find(".ListingForm-input[data-qa-advanced-view-checkbox]").click
 end
Then (/^(.+) selects and unselect amenities "(.*?)"$/) do |role, amenities|
  2.times {find(".ListingForm-input--checkbox", :text => amenities).click}
end
Then /^(.+) clicks SEE RESULTS in modal$/ do |role|
  find(".AdvancedFilter-modalFooter-button", :text => "SEE RESULTS").click

end
Then (/^(.+) selects Rental Period "(.*?)" in modal$/) do |role,period|
find(".ListingForm-input--fullWidth[data-qa-advanced-rental-period-input]").click
find(".Select-option", :exact_text => period).click
end

###
And (/^(.+) should see all listings from selected baths "(.*?)"$/) do |role, baths|
  expect(page).to have_css(".SearchBar-section[data-qa-searchbar-beds-baths-input]", :text => baths+"+ BA")
end
When (/^(.+) on Rentals page$/) do |role|
    visit '/for-rent'
end
And /^(.+) should see No results$/ do |role|
  expect(page).to have_css(".ListingGroup-empty",:text => "Your search returned no results.")
end

Then /^(.+) clicks Save Search$/ do |role|
  find(".Button", :text => "SAVE SEARCH").click
end

And  /^(.+) should see Registration form$/ do |role|
  expect(page).to have_css(".Form-wrap--extraSpace", :text => "Sign in to your Out East account")

end

 Then /^(.+) clicks Save listing$/ do |role|
   page.all(".Button--saveLink[data-save-listing-button]")[1].click
 end
#HDP
Then /^(.+) clicks listing$/ do |role|
 page.all(".CardDesktop")[1].click
  sleep 5
end
And /^(.+) should see listing page$/ do |role|
  expect(page).to have_css(".Hdp")
end

Then /^(.+) clicks Save$/ do |role|
  find("a.Button.Button--save", :text => "SAVE").click
end
Then /^(.+) clicks CLOSE form$/ do |role|
  find(".Modal-close").click
end

Then /^(.+) clicks CONTACT AGENT$/ do |role|
  find("a.Button.Button--primary", :text => "CONTACT AGENT").click
end

And /^(.+) should see contact form$/ do |role|
  expect(page).to have_css(".ContactAgentForm")
end
Then /^(.+) clicks CLOSE contact form$/ do |role|
  find(".ContactAgentForm-closeButton").click
end
Then /^(.+) fills name$/ do |role|
  name = FFaker::Name.name
  fill_in 'name', :with => name
end
Then /^(.+) fills email$/ do |role|
  email = FFaker::Internet.email
  fill_in 'email', :with => email
end
Then /^(.+) fills phone$/ do |role|
  phone =FFaker::PhoneNumber.phone_number
  fill_in 'phone', :with => phone
end
Then /^(.+) fills message$/ do |role|
  fill_in 'message', :with => 'Some message to agent'
end
Then /^(.+) clicks SEND$/ do |role|
  click_button "Send"
end
# And /^I should see "Message has been sent"$/ do
#   expect(page).to have_css(".InfoBar-content", :text => "Message has been sent")
# end
Then /^(.+) clicks SHARE$/ do |role|
  find(".Button--iconShare").click
end
And /^(.+) should see share form$/ do |role|
  expect(page).to have_css(".ShareListing")
end
Then /^(.+) clicks CLOSE share form$/ do |role|
  find(".Modal-close").click
end
Then /^(.+) fills share with$/ do |role|
  sh_email = FFaker::Internet.email
  fill_in 'recipientEmail', :with => sh_email
end
Then /^(.+) clicks SEND share$/ do |role|
  click_button "Send request"
end
And (/^(.+) should see "(.*?)" message$/) do |role, infobar|
  expect(page).to have_css(".InfoBar-content", :text => infobar)
end

#Slider
Then /^(.+) clicks < on main photo$/ do |role|
 2.times{find(".PhotoSlider .slick-arrow.slick-prev").click}
end
Then /^(.+) clicks > on main photo$/ do |role|
  find(".Sliders-photoSlider").hover
  2.times{find(".PhotoSlider .slick-arrow.slick-next").click}
end
Then /^(.+) clicks > on the bottom,preview$/ do |role|
  2.times{find(".Carousel .slick-arrow.slick-next").click}
end
Then /^(.+) clicks < on the bottom,preview$/ do |role|
  2.times{find(".Carousel .slick-arrow.slick-prev").click}
end
Then /^(.+) clicks map view$/ do |role|
find(".MapButton").click
end
Then /^(.+) closes map view$/ do |role|
  find(".RoundCloseButton").click
end
Then /^(.+) clicks full screen photo$/ do |role|
  find(".PhotoSlider-expandButton").click
end
And /^(.+) should see Lightbox$/ do |role|
  expect(page).to have_css(".LightBox")
end

#lightbox
Then /^(.+) clicks lightbox Save$/ do |role|
  find("a.Button--iconHeartWhite", :text => "SAVE").click
end
Then /^(.+) clicks lightbox SHARE$/ do |role|
  find(".Button--iconShareWhite").click
end
Then /^(.+) clicks lightbox CONTACT AGENT$/ do |role|
  find(".LightBox-button").click
end
Then /^(.+) clicks on preview$/ do |role|
  page.all(".Carousel-image")[0].click
end

Then /^(.+) clicks on map$/ do |role|
  find(".MapButton.MapButton--lightBox").click
end

And /^(.+) should see MapView$/ do |role|
  expect(page).to have_css(".MapView.MapView--lightBox")
end

#Authorized
And /^(.+) should see SAVED search$/ do |role|
  expect(page).to have_css(".SearchBar .Button--primary", :text => "SAVED")
  sleep 0.3
end

Then /^(.+) clicks SAVED$/ do |role|
  find(".SearchBar .Button--primary", :text => "SAVED").click
end
And  /^(.+) should see SAVE search$/ do |role|
  expect(page).to have_css(".SearchBar .Button--primary", :text => "SAVE SEARCH")
  sleep 0.3
end

Then /^(.+) should see saved listing hdp$/ do |role|
  expect(page).to have_css(".Button.Button--save.isActive", :text => "SAVED")
end
Then /^(.+) clicks SAVED hdp$/ do |role|
  find(".Button.Button--save.isActive", :text => "SAVED").click
end

And  /^(.+) should see save listing$/ do |role|
   expect(page).to have_css(".Button--saveLink[data-save-listing-button]:nth-child(1)", :text => "SAVE")
 end

When /^(.+) goes to HDP$/ do |role|
  visit "properties/sales/12921"
end
Then /^(.+) clicks agent link$/ do |role|
  agent_link= page.all(".AgentBox-fullName a").count
  page.all(".AgentBox-fullName a")[rand(agent_link)].click
end
Then /^(.+) should be on agent page$/ do |role|
expect(page).to have_css(".AgentPage")
end

#Agent page
When /^(.+) on Agent page$/ do |role|
  visit "/agents/1057/susan-ryan/east-hampton"
end
Then /^(.+) clicks Show phone number$/ do |role|
find(".AgentProfile-contactPhoneButtonText", :text => "Show phone number").click
end
And /^(.+) should see a number$/ do |role|
  expect(page).to have_css(".AgentProfile-contactPhonesContainer.isActive")
end
Then /^(.+) clicks CLOSE modal$/ do |role|
  page.all(".Modal-close")[2].click
end
Then /^(.+) clicks Active Sales$/ do |role|
  find(stiky_tab, :text => "Active Sales").click
end
Then /^(.+) clicks Past Sales$/ do |role|
  find(stiky_tab, :text => "Past Sales").click
end
Then /^(.+) clicks Past Rentals$/ do |role|
  find(stiky_tab, :text => "Past Rentals").click
end
Then /^(.+) clicks Active Rentals$/ do |role|
  find(stiky_tab, :text => "Active Rentals").click
end
And /^(.+) should see Active Sales$/ do |role|
  expect(page).to have_css(active_stiky_tab, :text => "Active Sales")
end
And /^(.+) should see Past Sales$/ do |role|
  expect(page).to have_css(active_stiky_tab, :text => "Past Sales")
end
And /^(.+) should see Past Rentals$/ do |role|
  expect(page).to have_css(active_stiky_tab, :text => "Past Rentals")
end
And /^(.+) should see Active Rentals$/ do |role|
  expect(page).to have_css(active_stiky_tab, :text => "Active Rentals")
end
Then /^(.+) scrolls down$/ do |role|
  page.execute_script "window.scrollBy(0,3000)"
  sleep 2
  end
And /^(.+) should see stiсky tab and Contact button$/ do |role|
expect(page).to have_css(".AgentProfile--stickedOnTop")
expect(page).to have_css(".AgentPageTabs-agentProfileRight.isTabsSticky")
end

Then /^(.+) clicks CONTACT AGENT stiсky$/ do |role|
  find(".AgentPageTabs-agentProfileRight.isTabsSticky", :text => "CONTACT AGENT").click
end
Then /^(.+) clicks any listing$/ do |role|
# cards=page.all(".ListingGroup-cards .CardDesktop").count
# page.all(".ListingGroup-cards .CardDesktop")[rand(cards)].click
click_any_listing(".ListingGroup-cards .CardDesktop")
end
And /^(.+) should see HDP$/ do |role|
  expect(page).to have_css(".Hdp")
end
Then (/^(.+) clicks "(.*?)" listing, and should see "(.*?)"$/) do |role, action, result|
  random_listing=page.all(".CardDesktop-action", :exact_text =>action).count
  #puts random_listing
  listing = page.all(".CardDesktop-action", :exact_text =>action)[rand(random_listing)]
  listing.click
  sleep 5
  puts listing.text
  if listing.text == result
    res=true
  else
    res=false
  end
  expect(res).to be true
end

And (/^(.+) should see "(.*?)" on the map$/) do |role,action|
  custom_expect (action)
  page.execute_script "window.scrollTo(0,0)"
  sleep 5
end

Then (/^(.+) clicks "SAVED preview" preview on the map$/) do |role|
  find(".CardPreview .Button.Button--saveLink.isActive").click
end
Then (/^(.+) clicks "SAVE preview" preview on the map$/) do |role|
  find(".CardPreview .Button.Button--saveLink").click
end
Then (/^(.+) clicks review on the map$/) do |role|
  find(".CardPreview").click
end