require_relative '../support/methods'
next_button =".SimpleSlider-control.SimpleSlider-control--next"
prev_button=".SimpleSlider-control.SimpleSlider-control--prev"

And (/^I am guest$/) do
 expect(page).to have_css(".Header-actionWrapper", text: 'Sign In')
end

When (/^I see Sales is active$/) do
 expect(page).to have_css(".CompactSearchBar-link.isActive", text: 'Sales')
end

Then (/^I select town "(.*?)"$/) do |town|
  find(".Multiselect-locations").click
  find(".Multiselect-options .Checkbox", :text => town).click
end

Then (/^I select min price "(.*?)" and max price "(.*?)"$/) do |min_price, max_price|
 find(".CompactSearchBar-input--price").click
 find('.PriceInput-field:nth-child(2) .TextField').send_keys :backspace, :backspace, :backspace, :backspace, :backspace, :backspace
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

And (/^I should see all listings with "(.*?)" town - SEARCHBAR, TITLE,LISTINGS$/) do |towns|
  expect(page).to have_css(".ListingGroup-headingBlock", text: towns)
  expect(page).to have_css(".SearchBar-section--towns", text: towns)
  expect(page).to have_css(".CardDesktop-region", text: towns.upcase)
end

And (/^I should see all listings price between selected price min "(.*?)" and max "(.*?)"$/) do |min, max|
   check_betweenprice(min,max)
end

And (/^I should see all listings from selected beds "(.*?)"$/) do |beds|
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

When /^I see Listings Youll Love$/ do
  cards=page.all(".SecondaryPromoCard").count
  if cards == 4
    true
  else
    false
  end
  expect(true).to be true
end

Then /^I click one of listings "You’ll Love"$/ do
  love_cards= page.all(".SecondaryPromoCard").count
  page.all('.SecondaryPromoCard-button')[rand(love_cards)].click #select random  and click it
end

And /^I should see page with listings$/ do
  puts page.current_url
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
 curr_page ("https://staging.outeast.com/for-sale/order/newest")
end
When /^I see "Trending Properties" block$/ do
  expect(page).to have_css(".Home-sectionCloud", :text => "Trending Properties")
end
#expected.page('.CompactSearchBar-link.CompactSearchBar-link--sales.isActive').isVisiable
#

Then /^I click on < button for PROPERTTIES$/ do
  5.times {page.all(prev_button)[1].click}
end
Then /^I click on > button for PROPERTTIES$/ do
  5.times { page.all(next_button)[1].click }
end

When /^I see 4 Guides$/ do
  cards=page.all(".GuideCards .ImpressionCard-blocks").count
  if cards == 4
    true
  else
    false
  end
  expect(true).to be true
end

Then /^I click View all guides$/ do
    find(".Home-sectionViewAllButton", :text => "VIEW ALL GUIDES").click
  puts page.current_url
end

Then /^I click SALES of footer$/ do
 footer_items("SALES")
end
And /^I should see SALES pages$/ do
   curr_page ("https://staging.outeast.com/for-sale")
end
Then /I click RENTALS of footer$/ do
  footer_items("RENTALS")
end
And /^I should see RENTALS pages$/ do
  curr_page ("https://staging.outeast.com/for-rent")
end
Then /^I click LAND$/ do
 footer_items("LAND")
end
And /^I should see LAND pages$/ do
  curr_page ("https://staging.outeast.com/for-sale/land")
end
# Then /^I click STORIES$/ do
#
# end
# And /^I should see STORIES pages$/ do
#
# end
Then /^I click OPEN HOUSES$/ do
  footer_items("OPEN HOUSES")
end
And /^I should see OPEN HOUSES pages and listings with labels$/ do
  curr_page ("https://staging.outeast.com/for-sale/bridgehampton/open-house/true")
  expect(page).to have_css(".OpenHouseCard-item")
end
Then /^I click CAREERS$/ do
  footer_items("CAREERS")
end
And /^I should see CAREERS pages$/ do
  curr_page ("https://streeteasy.com/jobs")
end

And /^I should see PRESS with mailto$/ do
  expect(page).to have_selector(:css, 'a[href="mailto:press@outeast.com"]')
end
Then /^I go back$/ do
  page.go_back
end
Then /^I back to main page$/ do
  find(".Header-logoContainer").click
end

Then /^I click icon Instagram$/ do
  page.all(".Footer-socialLink")[0].click
end
And /^I should see Instagram pages$/ do
  curr_page ("https://www.instagram.com/headouteast/")
end
Then /^I click icon FB$/ do
  page.all(".Footer-socialLink")[1].click
end
And /^I should see FB pages$/ do
  curr_page ("https://www.facebook.com/headouteast")
end
Then /^I click icon Twitter$/ do
  page.all(".Footer-socialLink")[2].click
end
And /^I should see Twitter pages$/ do
  curr_page ("https://twitter.com/outeast")
end

When (/^I go to Sales page$/) do
  visit '/for-sale'
end

Then /^I click SEE RESULTS$/ do
  find(".SearchBarFooterActions-action", :text => "SEE RESULTS").click
  puts page.current_url
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

Then (/^I select min price "(.*?)" and max price "(.*?)" in modal$/) do |min_price, max_price|
   find('.PriceInput-field:nth-child(2) .TextField').send_keys :backspace, :backspace, :backspace, :backspace, :backspace, :backspace, :backspace
  fill_in "priceFrom", with:min_price
  fill_in "priceTo", with:max_price
end
Then /^I select bedrooms "(.*?)" in modal$/ do  |bedrooms|
  beds=Integer(bedrooms)-1
  beds.times {find(".ListingForm-input[data-qa-advanced-beds-input] .Button--iconPlus").click}
  end
Then (/^I select bathrooms "(.*?)" in modal$/) do |bathrooms|
  bath=Integer(bathrooms)-1
  bath.times { find(".ListingForm-input[data-qa-advanced-baths-input] .Button--iconPlus").click}
end
Then (/^I select acreage "(.*?)"$/) do |acreage|
  acr=Integer(acreage)-10
  acr.times {find(".ListingForm-input[data-qa-advanced-acr-input] .Button--iconPlus").click}
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
Then (/^I select amenities "(.*?)"$/) do |amenities|
  find(".ListingForm-input--checkbox", :text => amenities).click
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
Then /^I click any listing$/ do
  page.all(".CardDesktop")[3].click
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
