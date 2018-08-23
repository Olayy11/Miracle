public
def check_betweenprice(min,max)
  cardprice=".CardDesktop-price >.CardDesktop-priceNumber"
  errors=0
  page.all(cardprice).each do |price|
    if price.text.gsub(/\D/,'').to_i < min||price.text.gsub(/\D/,'').to_i > max
     errors+=1
    end
  end
  expect(errors<1).to be true
end

def check_beds (beds)
  bed = ".CardDesktop-detailItem:nth-child(1) > span.CardDesktop-itemNumber"
  expect(page).to have_css(".SearchBar", text: beds)
  errors = 0
  page.all(bed).each do |bed_number|
    if Integer(bed_number.text) < Integer(beds)
      errors+=1
    end
  end
  expect(errors<1).to be true
end

def check_shot_dates (dates)
  case dates
    when "June/July"
      expect(page).to have_css(".Select-selectedOptionText", exact_text: "JUN-JUL")
    when "Memorial Day to Labor Day"
      expect(page).to have_css(".Select-selectedOptionText", exact_text: "MD-LD")
    when "June"
      expect(page).to have_css(".Select-selectedOptionText", exact_text: "JUN")
    when "July"
      expect(page).to have_css(".Select-selectedOptionText", exact_text: "JUL")
    when "Any Dates"
      expect(page).to have_css(".Select-selectedOptionText", exact_text: "DATES")
    when "August through Labor Day"
      expect(page).to have_css(".Select-selectedOptionText", text: "AUG-LD")
    when "July/August through Labor Day"
      expect(page).to have_css(".Select-selectedOptionText", text: "JUL-LD")
    when "Extended Season"
      expect(page).to have_css(".Select-selectedOptionText", exact_text: "Extended Season")
    when "Short Term"
      expect(page).to have_css(".Select-selectedOptionText", exact_text: "Short Term")
    when "Winter"
      expect(page).to have_css(".Select-selectedOptionText", exact_text: "Winter")
    when "Year Round"
      expect(page).to have_css(".Select-selectedOptionText", exact_text: "Year Round")
    else
      puts "FALSE"
  end
end

def curr_page (url_need)
 # expect(page.current_url)
 arg = Capybara.app_host + url_need
  if page.current_url != arg
    result = false
  else
    result = true
  end
  expect(result).to be true
end

def another_page (url_need)
  # expect(page.current_url)
  arg = url_need
  if page.current_url != arg
    result = false
  else
    result = true
  end
  expect(result).to be true
end


def number_cards (selector, number)
cards=page.all(selector).count
if cards == number
  res= true
else
  res= false
end
expect(res).to be true
end

def footer_items(item)
find(".Footer-quickLink", :text => item).click
end

def new_tab (clicki, tab_url)
  new_window = window_opened_by {find(".Button.Button--secondary", :text => "VIEW ALL GUIDES").click}
  within_window new_window do
    curr_page ("/guides/")
    puts page.current_url
    page.execute_script('window.close()') # close new page
    switch_to_window(windows.first)
  end
end

def custom_click_button (text)
  case text
  when "VIEW ALL GUIDES"
    find(".Button.Button--secondary", :text => "VIEW ALL GUIDES").click
  when "VIEW MORE STORIES"
    find(".Button.Button--secondary", :text => "VIEW MORE STORIES").click
  else
    puts 'd'
   end
end


#+++++
# Scenario: Guides from main page TEST VERSION
# When I see 4 Guides
# Then I click "VIEW ALL GUIDES"
# Then I should see NEW TAB with url "/guides/"
# Then (/^I click "(.*?)"$/) do |button_name|
#   custom_click_button(button_name)
#
# end
#
# Then (/^I should see NEW TAB with url "(.*?)"$/) do |url|
#   sleep (5)
#   new_window = windows.last
#   within_window new_window do
#   puts windows[1]
#   puts page.current_url
#     curr_page (url) #"/guides/"
#
#     page.execute_script('window.close()') # close new page
#     switch_to_window(windows.first)
#   end
# end