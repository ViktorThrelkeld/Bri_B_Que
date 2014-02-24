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


Given(/^the user "(.*?)"\/"(.*?)" with "(.*?)"$/) do |username, email, password|
 user = User.create(username: username, email: email, password: password, password_confirmation: password)
  user.create_profile(bio: "MY PROFILE!!!!!!")
end

Given(/^the following user:$/) do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end



When(/^I sign up$/) do
  steps %Q{
    When I go to the homepage
    And I follow "Sign Up"
    And I fill in "joe" for "Username"
    And I fill in "joe@example.com" for "Email"
    And I fill in "password" for "user_password"
    And I fill in "password" for "Password confirmation"
    And I press "Sign up"
  }
end

When(/^I sign in$/) do
   steps %Q{
    Given the user "joe"/"joe@example.com" with "password"
    When I go to the homepage
    And I follow "Sign In"
    And I fill in "joe@example.com" for "Email"
    And I fill in "password" for "Password"
    And I press "Sign in"
   }
end




