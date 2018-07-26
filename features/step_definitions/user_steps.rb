Capybara.app_host = 'https://outeast.com'
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
  click_button 'Sign In'
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

#expect(page).to have_content('Please enter an email')


#REGISTERATION

#common part for sign up steps
When /^I click on 'Sign up'$/  do
  find('div.Header-actionWrapper').find('a.Header-actionName:nth-child(2)').click
end

When /^I Sign_up with "(.*?)" username and "(.*?)" password$/ do |user, password|
  fill_in 'email', :with => user
  fill_in 'password', :with => password
  click_button 'Sign Up'
  Capybara.default_max_wait_time
end
#end of common part

When /^I successfully registered$/ do
  expect(page).to have_css(header, text: 'Your Account')
end