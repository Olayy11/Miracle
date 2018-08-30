When /^I hover the mouse over Saved Items$/ do
  find(".Header-actionName", :text =>"Saved Items").hover
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
