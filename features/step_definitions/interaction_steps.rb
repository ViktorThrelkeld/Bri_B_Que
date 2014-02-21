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

When(/^I follow "(.*?)"$/) do |link|
  click_link(link)
end

Then(/^I should not see "(.*?)"$/) do |text|
   page.should_not have_content(text)
end

Given(/^the user "(.*?)" with "(.*?)"$/) do |email, password|
  User.create(email: email, password: password, password_confirmation: password)
end


Given(/^the following user:$/) do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end





