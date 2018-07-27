Capybara.app_host = 'https://staging.outeast.com'

When /^I click on 'Search'$/  do
  find('input.HeaderSearch-field').click
end

When /^I start writing "(.*?)" town$/ do |searchText|
  find(".ExpandedHeaderSearch-editable").set searchText
end

Then(/^I should see all results with "(.*?)"$/) do |expectedText|
 #expect(page.all).to have_content(expectedText)
 # page.all('.SearchResults-item', :text => 'bngfth]b')#expectedText)
 expect(page).to have_css(".SearchResults-item", :text => expectedText)
 Capybara::Screenshot.autosave_on_failure = false
 end

#page.find('span', :text => 'User2').find(:xpath, '..').fill_in('.SearchResults-item', :with => expectedText