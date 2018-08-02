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

And (/^I logged$/) do
  find('div.Header-actionWrapper').find('a.Header-actionName:nth-child(1)').click
  fill_in 'email', :with => '8@gmail.com'
  fill_in 'password', :with => 'qwertyQ1'
  click_button 'Sign'
  Capybara.default_max_wait_time
end

When /^I click on 'Search'$/  do
  find('input.HeaderSearch-field').click
end

When /^I start writing "(.*?)"$/ do |searchText|
  find(".ExpandedHeaderSearch-editable").set searchText
end

Then(/^I should see all results with "(.*?)"$/) do |expectedText|
 expect(page).to have_css(".SearchResults-item", :text => expectedText)
 Capybara::Screenshot.autosave_on_failure = false
end

Then(/^I should see all results with "(.*?)" in town$/) do |expectedText|
  expect(page).to have_css(towns, :text => expectedText)
  Capybara::Screenshot.autosave_on_failure = false
end

Then(/^I should see all results with "(.*?)" in addresses$/) do |expectedText|
  expect(page).to have_css(address, :text => expectedText)
end

Then(/^I should see results number of title the same as results$/) do
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

Then(/^I should see message about NO RESULTS$/) do
  expect(page).to have_content("Your search returned no results")
end

Then(/^I click any result$/) do
  results_address=page.all(address).count
  # print results_address
  page.all('.SearchResults-category:nth-child(2) .SearchResults-item  a')[rand(results_address)].click #select random address and click it
  end


And (/^I direct to SRP with selected "(.*?)" in addresses title$/) do   |expectedText|
  expect(page).to have_css(".Hdp-locationInfo", :text => expectedText)
end

And (/^I direct to HDP page with selected "(.*?)" in addresses town$/) do  |expectedText|
  expect(page).to have_css(".Multiselect-locationWrapper", :text => expectedText)
end

Then (/^I should see search page without changing$/) do
  expect(page).to have_css(".ExpandedHeaderSearch")
  expect(page).to have_no_content('result')
end

Then (/^I click on 'X'$/)do
  find('.HeaderSearchCloseIcon').click
end

Then (/^I should see main page$/) do
  expect(page).to have_no_css(".SearchPanel-content")
  expect(page).to have_no_content('Start typing an address, town, or area')
  expect(page).to have_css(".CompactSearchBar")
end

When (/^I click Rental$/)do
  visit '/for-rent';
end

When (/^I click Sales$/)do
  visit '/for-sale';
end

Then (/^I should see rental page$/) do
  expect(page).to have_no_css(".SearchPanel-content")
  expect(page).to have_no_content('Start typing an address, town, or area')
  expect(page).to have_css(".SearchBar")
end

Then (/^I should see sales page$/) do
  expect(page).to have_no_css(".SearchPanel-content")
  expect(page).to have_no_content('Start typing an address, town, or area')
  expect(page).to have_css(".SearchBar")
end

Then (/^I see recently viewed$/) do
@titleprice=find(".Card-priceNumber").text
find('.Card.Card--withoutBorder a').click
end

When (/^I click Sales item$/)do
  visit '/for-sale'
  find('.ListingGroup-card:nth-child(1) .CardDesktop').click
  @titlenumber=find(".Title--secondary").text
end

And (/^Price of clicked Sales item and recently viewed are identical$/)do
  expect(page).to have_css(".Title--secondary", :text=>@titleprice)
  #puts @titleprice
end



#   end
# #page.find('span', :text => 'User2').find(:xpath, '..').fill_in('.SearchResults-item', :with => expectedText
# #page.all('.search-result')[1].click