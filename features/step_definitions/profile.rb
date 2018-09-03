modal = (".Header-actionName")
link_account=(".SimpleList-item")

When (/^(.+) hovers the mouse over "(.*?)"$/) do |role, item|
  find(modal, :text =>item).hover
end
And /^(.+) should see saved items Modal$/ do |role|
  expect(page).to have_css(".SimpleTabs")
end
Then /^(.+) clicks VIEW ALL saved$/ do |role|
  find(".SimpleTabs-action", :text => "VIEW ALL").click
  sleep 5
end
And /^(.+) should see "(.*?)" page$/ do |role, url|
  curr_page(url)
end
And /^(.+) should see that "(.*?)" is active$/ do |role, items|
  expect(page).to have_css('.SimpleTabs-title.isActive', :text => items)
end
Then /^(.+) clicks Searches$/ do |role|
  find(".SimpleTabs-title", :text => "Searches").click
end
And /^(.+) should see all listings with saved icon$/ do |role|
  expect(page).to have_css('img.CardsPreview-icon[alt="I heart fill"]')
end
Then /^(.+) clicks any saved listing$/ do |role|
  click_any_listing(".CardsPreview-card")
end
Then /^(.+) clicks any saved search$/ do |role|
 click_any_listing(".SimpleList-item")
end
And /^(.+) should see SRP$/ do |role|
  expect(page).to have_css(".Srp")
end
# profile
And /^(.+) should see Your account Modal$/ do |role|
  expect(page).to have_css(".Popover")
end
Then /^(.+) clicks "(.*?)" item$/ do |role, item|
find(link_account, :text => item).click
end

And /^(.+) should see Signin$/ do |role|
expect(page).to have_css(".Header-actionName", :text=>"Sign In")
end

And /^(.+) should see "(.*?)" is active$/ do |role, saved|
  expect(page).to have_css(".Account-listItem", :text=>saved)
end
And /^(.+) should see "(.*?)" block$/ do |role, block|
  expect(page).to have_css(".ListingGroup-title", :text=> block)
end

And /^(.+) should see Saved Listing block$/ do |role|
  expect(page).to have_css('.ListingGroup[data-qa-saved-sales]')
end

Then /^(.+) clicks SAVED for one listing$/ do |role|
  page.all(".Button.isActive", :text => "SAVED")[1].click
end

And /^(.+) should SAVE$/ do |role|
  expect(page).to have_css(".Button", :text => "SAVE")
end

Then /^(.+) reloads page$/ do |role|
page.evaluate_script("window.location.reload()")
end
And /^(.+) shouldn't see SAVE$/ do |role|
  expect(page).to have_no_selector(".Button", :exact_text => "SAVE")
end

Then /^(.+) clicks "next" for "saved sale"$/ do |role|
  page.all(".Pagination-control a.Button--iconRight")[0].click
  sleep 5
end
And (/^(.+) should see "(.*?)" info$/) do |role, pages|
  expect(page).to have_css(".Pagination-info", :text => pages)
  end
Then /^(.+) click "prev" for "saved sale"$/ do |role|
  page.all(".Pagination-control a.Button--iconLeft")[0].click
end
Then /^(.+) click "next" for "saved rentals"$/ do |role|
  page.all(".Pagination-control a.Button--iconRight")[1].click
  sleep 5
end
Then /^(.+) click "prev" for "saved rentals"$/ do |role|
  page.all(".Pagination-control a.Button--iconLeft")[1].click
end