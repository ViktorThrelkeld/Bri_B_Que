Feature: Create a recipe
  In order to share and compare recipes
  As a Barbeque enthusiast
  I want to post my recipes

  Scenario: Trying to create a blank recipe fails
    Given I am on the homepage
    Then I click "Sign In"
    And I fill in "joe@example.com" for "Email"
    And I fill in "password" for "Password"
    And I press "Sign In"
    Then I should be on that user's profile page
    And I should see "Add A Recipe"
    When I press "Add A Recipe"
    And I should be on Add A Recipe page
    Then I should see "Add A Recipe"
    When I press "Add Recipe"
    Then I should see "Your fields can't be blank"
@wip
  Scenario: Creating a recipe with a body succeeds
    When I go to "Add A Recipe"
    Then I should see "Add A Recipe"
    When I fill in "Chicken" for "Ingredients Here"
    And I fill in "Grill" for "Instructions Here"
    And I press "Add Recipe"
    Then I should see "Your recipe has been posted"
    And I should be on the "Show Recipe" page
    And I should see "Chicken"
    And I should see "Grill"


