Capybara.app_host = 'https://staging.outeast.com'

When /^I click on 'Search'$/  do
  find('input.HeaderSearch-field').click
end

When /^I start writing "(.*?)" town$/ do |searchText|
  find(".ExpandedHeaderSearch-editable").set searchText
end

Then(/^I should see "(.*?)"$/) do |expectedText|
  expect(page).to have_content(expectedText)
end



