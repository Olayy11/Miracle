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
  find(".Multiselect").click
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

Then /^I click next page$/ do
  find(".Button--iconRight").click
  Capybara.default_max_wait_time
end

And (/^I should see all next results with selected prices "(.*?)" and "(.*?)" too$/) do |min,max|
  check_betweenprice(min,max)
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