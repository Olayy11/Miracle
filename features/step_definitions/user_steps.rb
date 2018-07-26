Capybara.app_host = 'https://staging.outeast.com'
header = '.Header-actionName'
modal = '.Modal-content'


Given /^I am on (.+)$/ do |url|
  visit '/';
end

#common part for login steps
When /^I click on 'Sign in'$/  do
  find('div.Header-actionWrapper').find('a.Header-actionName:nth-child(1)').click
 end

When /^I login with "(.*?)" username and "(.*?)" password$/ do |user, password|
  fill_in 'email', :with => user
  fill_in 'password', :with => password
  click_button 'Sign'
  Capybara.default_max_wait_time
end

When /^I login with email and "(.*?)" password$/ do |password|
  email = FFaker::Internet.email
  fill_in 'email', with: email  #=> "kirsten.greenholt@corkeryfisher.info"
  fill_in 'password', :with => password
  click_button 'Sign'
  Capybara.default_max_wait_time
end
#end of common part

When /^I successfully login$/ do
  expect(page).to have_css(header, text: 'Your Account')
 end

When /^I unsuccessfully login$/ do
  expect(page).to have_css(modal, text: 'Invalid email or password.')
end

When /^I see message about empty fields$/ do
  expect(page).to have_css(modal, text: 'Please enter an email')
  expect(page).to have_css(modal, text: 'Please enter a password')
end

When /^I see message about empty email$/ do
  expect(page).to have_css(modal, text: 'Please enter an email')
end

When /^I see message about empty password$/ do
  expect(page).to have_css(modal, text: 'Please enter a password')
  end


When /^I see message about not registered data$/ do
  expect(page).to have_css(modal, text: 'Invalid email or password')
end


When /^I click on 'Sign up'$/  do
  find('div.Header-actionWrapper').find('a.Header-actionName:nth-child(2)').click
end

When /^I successfully registered$/ do
  expect(page).to have_css(header, text: 'Your Account')
end

When /^I see message about wrong email$/ do
  expect(page).to have_css(modal, text: 'Email is not valid')
end

When /^I see message about wrong password$/ do
  expect(page).to have_css(modal, text: 'Your password must be at least 8 characters long')
end



