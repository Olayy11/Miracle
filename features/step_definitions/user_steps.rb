Capybara.app_host = 'https://staging.outeast.com'
header = '.Header-actionName'
modal = '.Modal-content'

Given /^Visitor is at (.+)$/ do |url|
  visit '/';
end

#common part for login steps
When /^(.+) clicks on 'Sign in'$/  do |role|
  # find('div.Header-actionWrapper').find('a.Header-actionName:nth-child(1)').click
  find(".Header-actionName", :text => "Sign In").click
 end

When /^(.+) tries to login with "(.*?)" username and "(.*?)" password$/ do |role, user, password|
  fill_in 'email', :with => user
  fill_in 'password', :with => password
  click_button 'Sign'
  Capybara.default_max_wait_time
end

When /^(.+) tries to login with email and "(.*?)" password$/ do |role, password|
  email = FFaker::Internet.email
  fill_in 'email', with: email  #=> "kirsten.greenholt@corkeryfisher.info"
  fill_in 'password', :with => password
  click_button 'Sign'
  Capybara.default_max_wait_time
end
#end of common part

When /^(.+) successfully logged$/ do |role|
  expect(page).to have_css(header, text: 'Your Account')
 end

When /^(.+) should see message about invalid email or password$/ do |role|
  expect(page).to have_css(modal, text: 'Invalid email or password.')
end

When /^(.+) should see message about empty fields$/ do |role|
  expect(page).to have_css(modal, text: 'Please enter an email')
  expect(page).to have_css(modal, text: 'Please enter a password')
end

When /^(.+) should see message about empty email$/ do |role|
  expect(page).to have_css(modal, text: 'Please enter an email')
end

When /^(.+) should see message about empty password$/ do |role|
  expect(page).to have_css(modal, text: 'Please enter a password')
  end

When /^(.+) should see message about not registered data$/ do |role|
  expect(page).to have_css(modal, text: 'Invalid email or password')
end

When /^(.+) clicks on 'Sign up'$/  do |role|
  # find('div.Header-actionWrapper').find('a.Header-actionName:nth-child(2)').click
  find(".Header-actionName", :text => "Sign Up").click
end

When /^(.+) successfully registered$/ do |role|
  expect(page).to have_css(header, text: 'Your Account')
end

When /^(.+) should see message about wrong email$/ do |role|
  expect(page).to have_css(modal, text: 'Email is not valid')
end

When /^(.+) should see message about wrong password$/ do |role|
  expect(page).to have_css(modal, text: 'Your password must be at least 8 characters long')
end

