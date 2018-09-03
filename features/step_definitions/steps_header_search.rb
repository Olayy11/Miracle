#Capybara.app_host = 'https://staging.outeast.com'
towns = '.SearchResults-category:nth-child(1) .SearchResults-item'
towns_title = '.SearchResults-category:nth-child(1) >.SearchResults-title'
address='.SearchResults-category:nth-child(2) .SearchResults-item'
address_title='.SearchResults-category:nth-child(2) >.SearchResults-title'
area = '.SearchResults-category:nth-child(3) .SearchResults-item'
area_title = '.SearchResults-category:nth-child(3) >.SearchResults-title'
internet_number = '.SearchResults-category:nth-child(4) .SearchResults-item'
in_title = '.SearchResults-category:nth-child(4) >.SearchResults-title'

#require "./helper"
require_relative 'helper'
include VarHelper



And (/^(.+) is logged as user$/) do |role|
#  find('.Header-actionWrapper').find('a.Header-actionName:nth-child(1)').click
  find(".Header-actionName", :text => "Sign In").click
  fill_in 'email', :with => 'nunuveko@sfamo.com'
  fill_in 'password', :with => '12345678'
  click_button 'Sign'
  sleep 7
end

When /^(.+) clicks on 'Search'$/  do |role|
  find('input.HeaderSearch-field').click
end

When /^(.+) starts writing "(.*?)"$/ do |role, searchText|
  find(".ExpandedHeaderSearch-editable").set searchText
  sleep 5
end

Then(/^(.+) should see all results with "(.*?)"$/) do |role, expectedText|
 expect(page).to have_css(".SearchResults-item", :text => expectedText)
 Capybara::Screenshot.autosave_on_failure = false
end

Then(/^(.+) should see all results with "(.*?)" in town$/) do |role, expectedText|
  expect(page).to have_css(towns, :text => expectedText)
  Capybara::Screenshot.autosave_on_failure = false
end

Then(/^(.+) should see all results with "(.*?)" in addresses$/) do |role,expectedText|
  expect(page).to have_css(address, :text => expectedText)
end

Then(/^(.+) should see results number of title the same as results$/) do |role|
  results_town=page.all(towns).count
  expect(page).to have_css(towns_title, :text => results_town)
  #puts results_town
  results_addresses=page.all(address).count
  expect(page).to have_css(address_title, :text => results_addresses)
  #puts results_addresses
  results_area=page.all(area).count
  expect(page).to have_css(area_title, :text => results_area)
  #puts results_area
  results_internet=page.all(internet_number).count
  expect(page).to have_css(in_title, :text => results_internet)
  #puts results_internet
end

Then(/^(.+) should see message about NO RESULTS$/) do |role|
  expect(page).to have_content("Your search returned no results")
end

Then(/^(.+) clicks any result$/) do |role|
  results_address=page.all(address).count
  page.all('.SearchResults-category:nth-child(2) .SearchResults-item  a')[rand(results_address)].click #select random address and click it
  end


And (/^(.+) directs to SRP with selected "(.*?)" in addresses title$/) do   |role, expectedText|
  expect(page).to have_css(".Hdp-locationInfo", :text => expectedText)
end

And (/^(.+) directs to HDP page with selected "(.*?)" in addresses town$/) do  |role,expectedText|
  expect(page).to have_css(".Multiselect-locationWrapper", :text => expectedText)
end

Then (/^(.+) should see search page without changing$/) do |role|
  expect(page).to have_css(".ExpandedHeaderSearch")
  expect(page).to have_no_content('result')
end

Then (/^(.+) clicks on 'X'$/)do |role|
  find('.HeaderSearchCloseIcon').click
end

Then (/^(.+) should see main page$/) do |role|
  expect(page).to have_no_css(".SearchPanel-content")
  expect(page).to have_no_content('Start typing an address, town, or area')
  expect(page).to have_css(".CompactSearchBar")
end

When (/^(.+) clicks Rental$/)do |role|
  visit '/for-rent';
end

When (/^(.+) clicks Sales$/)do |role|
  visit '/for-sale';
end

Then (/^(.+) should see rental page$/) do |role|
  expect(page).to have_no_css(".SearchPanel-content")
  expect(page).to have_no_content('Start typing an address, town, or area')
  expect(page).to have_css(".SearchBar")
end

Then (/^(.+) should see sales page$/) do |role|
  expect(page).to have_no_css(".SearchPanel-content")
  expect(page).to have_no_content('Start typing an address, town, or area')
  expect(page).to have_css(".SearchBar")
end

Then (/^(.+) should see recently viewed$/) do |role|
@titleprice=page.all(".Card-priceNumber")[0].text
page.all('.Card.Card--withoutBorder a')[0].click
end

When (/^(.+) clicks Sales item$/)do |role|
  visit '/for-sale'
  find('.ListingGroup-card:nth-child(1) .CardDesktop').click
  @titlenumber=find(".Title--secondary").text
end

And (/^(.+) should see that price of clicked Sales item and recently viewed are identical$/)do |role|
  expect(page).to have_css(".Title--secondary", :text=>@titleprice)
end



#   end
# #page.find('span', :text => 'User2').find(:xpath, '..').fill_in('.SearchResults-item', :with => expectedText
# #page.all('.search-result')[1].click