modal = (".Header-actionName")
link_account=(".SimpleList-item")

When (/^I hover the mouse over "(.*?)"$/) do |item|
  find(modal, :text =>item).hover
end
And /^I should see saved items Modal$/ do
  expect(page).to have_css(".SimpleTabs")
end
Then /^I click VIEW ALL saved$/ do
  find(".SimpleTabs-action", :text => "VIEW ALL").click
  sleep 5
end
And /^I should see "(.*?)" page$/ do |url|
  curr_page(url)
end
And /^I should see that "(.*?)" is active$/ do |items|
  expect(page).to have_css('.SimpleTabs-title.isActive', :text => items)
end
Then /^I click Searches$/ do
  find(".SimpleTabs-title", :text => "Searches").click
end
And /^I should see all listings with saved icon$/ do
  expect(page).to have_css('img.CardsPreview-icon[alt="I heart fill"]')
end
Then /^I click any saved listing$/ do
  click_any_listing(".CardsPreview-card")
end
Then /^I click any saved search$/ do
 click_any_listing(".SimpleList-item")
end
And /^I should see SRP$/ do
  expect(page).to have_css(".Srp")
end
# profile
And /^I should see Your account Modal$/ do
  expect(page).to have_css(".Popover")
end
Then /^I click "(.*?)" item$/ do |item|
find(link_account, :text => item).click
end

And /^I should see Signin$/ do
expect(page).to have_css(".Header-actionName", :text=>"Sign In")
end

And /^I should see "(.*?)" is active$/ do |saved|
  expect(page).to have_css(".Account-listItem", :text=>saved)
end
And /^I should see "(.*?)" block$/ do |block|
  expect(page).to have_css(".ListingGroup-title", :text=> block)
end

And /^I should see Saved Listing block$/ do
  expect(page).to have_css('.ListingGroup[data-qa-saved-sales]')
end

Then /^I click SAVED for one listing$/ do
  page.all(".Button.isActive", :text => "SAVED")[1].click
end

And /^I should SAVE$/ do
  expect(page).to have_css(".Button", :text => "SAVE")
end

Then /^I reload page$/ do
page.evaluate_script("window.location.reload()")
end
And /^I shouldn't see SAVE$/ do
  expect(page).to have_no_selector(".Button", :exact_text => "SAVE")
end

Then /^I click "next" for "saved sale"$/ do
  page.all(".Pagination-control a.Button--iconRight")[0].click
  sleep 5
end
And (/^I should see "(.*?)" info$/) do |pages|
  expect(page).to have_css(".Pagination-info", :text => pages)
  end
Then /^I click "prev" for "saved sale"$/ do
  page.all(".Pagination-control a.Button--iconLeft")[0].click
end
Then /^I click "next" for "saved rentals"$/ do
  page.all(".Pagination-control a.Button--iconRight")[1].click
  sleep 5
end
Then /^I click "prev" for "saved rentals"$/ do
  page.all(".Pagination-control a.Button--iconLeft")[1].click
end