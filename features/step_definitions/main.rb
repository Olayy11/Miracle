When /^click agent$/ do
  visit '/agents/1000264/nancy-mizrahi/';
end

And (/^I click links$/) do


link='a.CardDesktop-link'
page.all(:css, link).each do |el|
  puts "#{el.inspect}: #{el.text}"
   #puts page.current_url

end
end