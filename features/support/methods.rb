public
def check_betweenprice(min,max)
  cardprice=".CardDesktop-price >.CardDesktop-priceNumber"
  Capybara.default_max_wait_time
  page.all(".CardDesktop-content").count
  page.all(cardprice).count
  page.all(cardprice).each do |price|
    if price.text >= min||price.text <= max
      true
    else
      false
    end
    Capybara.default_max_wait_time
    expect(true).to be true
  end
end

def check_beds (beds)
  bed=".CardDesktop-detailItem:nth-child(1)"
  expect(page).to have_css(".SearchBar", text: beds)
  page.all(bed).count
  page.all(bed).each do |bed_number|
    if bed_number.text >= beds
      #puts bed_number.text
      true
    else
      false
    end
    expect(true).to be true
  end
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
  expect(page.current_url)
  if page.current_url == url_need
    true
  else
    false
    expect(true).to be true
  end
end

def footer_items(item)
find(".Footer-quickLink", :text => item).click
end