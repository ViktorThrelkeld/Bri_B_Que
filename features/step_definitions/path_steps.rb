def path_to path_descriptor
  case path_descriptor
  when "the homepage"
    root_path
  when "Add A Recipe"
    add_a_recipe_path
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