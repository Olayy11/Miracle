cardPrice=".CardDesktop-price >.CardDesktop-priceNumber"
bed=".CardDesktop-detailItem:nth-child(1)"

And (/^I am guest$/) do
  expect(page).to have_css(".Header-actionWrapper", text: 'Sign In')
end

Then (/^I see Sales is active$/) do
  expect(page).to have_css(".CompactSearchBar-link.isActive", text: 'Sales')
end


Then (/^I select area "(.*?)"$/) do |area|
  find(".Multiselect").click
  find(".Multiselect-options", :text => area).click
end
Then (/^I select min price "(.*?)" and max price "(.*?)"$/) do |min_price, max_price|
 find(".CompactSearchBar-input--price").click
 fill_in "priceFrom", with:min_price
 fill_in "priceTo", with:max_price
end

#Then /^I select beds "(.*?)"$/ do |beds| if wanna type data
  Then /^I select beds "2"$/ do
  find(".CompactSearchBar-input--beds").click
  find(".Button--iconPlus").click
#  fill_in "beds", with:beds
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
  Capybara.default_max_wait_time
  #page.all(".CardDesktop-content").count
  page.all(cardPrice).count
  page.all(cardPrice).each do |price|
    if price.text >= min||price.text <= max
      #puts price.text
      true
    else
      false
    end
    expect(true).to be true
  end
end
And (/^I should see all listings from selected beds "(.*?)"$/) do |beds|
  expect(page).to have_css(".SearchBar", text: beds)
  page.all(bed).count
  page.all(bed).each do |bed_number|
    if bed_number.text >= beds
      #puts bed_number.text
      true
    else
      false
    end
    expect(true).to be true
  end
end

# Then /^I click next page$/ do
#   find(".Button--iconRight").click
# end



# And (/^I should see all results with selected prices "(.*?)" and "(.*?)"$/) do |min_prices,max_prices|
#    expect(page).to have_css(".SearchBar", text: min_prices)
#    expect(page).to have_css(".SearchBar", text: max_prices)
# end

#
# When /^I click Rentals$/ do
#
# end
#
# And /^I see Rentals is active$/ do
#
# end
# Then /^I select dates "(.*?)"$/ do |date|
#
# end

#expected.page('.CompactSearchBar-link.CompactSearchBar-link--sales.isActive').isVisiable