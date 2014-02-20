# When(/^I go to "(.*?)"$/) do |page|
#   visit
# end

Then(/^I should see "(.*?)"$/) do |text|
  page.should have_content(text)
end

When(/^I press "(.*?)"$/) do |text|
  click_button(text)
end

When(/^I fill in "(.*?)" for "(.*?)"$/) do |content, field|
  fill_in(field, with: content)
end

Then(/^I click "(.*?)"$/) do |link|
  click_link(link)
end





