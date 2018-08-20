And (/^I click link$/) do
  #find('a[href]').click
  #click_link('a[href]') .Footer a[href]
 # Capybara.default_max_wait_time
#end
  links= all(:css, '.Footer .Town-links a[href]')
  links.each do |link|
   #find(link).click
   visit link
    puts link
   # visit link
   # expect(last_response.status).to be(200)
   # expect(page).to have_http_status(200)
     expect(page.status_code).to be(200)
    puts page.status_code
    end
  end

