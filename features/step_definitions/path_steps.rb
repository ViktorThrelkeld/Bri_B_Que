def path_to path_descriptor
  case path_descriptor
  when "the homepage"
    root_path
  when "the create a recipe page"
    new_recipe_path
  when "the show recipe page"
    recipe_path(User.last.recipes.last)
  when "the sign in page"
    new_user_session_path
  when "the create a profile page"
    new_profile_path
  when "my profile page"
    profile_path(User.last.profile)
  when "update profile page"
    edit_profile_path(User.last.profile)
  when "show ingredients page"
    ingredient_path(Ingredient.last)
  when "create an ingredient page"
    new_ingredient_path

  else
    raise "Oh noes! You need to specify where this route goes in step_defintions/path_steps.rb"
  end
end

When /^I (?:go to|am on) (.*)$/ do |path_descriptor|
  visit path_to(path_descriptor)
end

Then /^I should be on (.*)$/ do |path_descriptor|
  current_path.should == path_to(path_descriptor)
end