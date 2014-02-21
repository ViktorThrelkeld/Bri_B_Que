When(/^I fill in "(.*?)" with "(.*?)"$/) do |field, content|
  fill_in(field, with: content)
end

When(/^I sign out$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should be able to sign in as "(.*?)" with the password "(.*?)"$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end
