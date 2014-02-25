
Feature: Create a recipe
  In order to share and compare recipes
  As a Barbeque enthusiast
  I want to post my recipes
  @wip
  Scenario: Trying to create a blank recipe title fails
    When I sign in
    When I follow "My Profile"
    Then I should be on my profile page
    When I follow "New Recipe"
    Then I should be on the create a recipe page
    Then I should see "Create A Recipe"
    When I press "Post Recipe"
    Then I should see "Your fields can't be blank"
  @focus
  Scenario: Creating a recipe with a title succeeds
    When I sign in
    When I follow "My Profile"
    Then I should be on my profile page
    When I follow "New Recipe"
    Then I should be on the create a recipe page
    When I fill in "Hot Chicken" for "Title"
    And I fill in "30 min." for "Prep time"
    And I fill in "1. Fry chicken and douse in hot sauce 2. Enjoy!" for "Instructions"
    # And I fill in "Grill" for "Instructions Here"
    And I press "Post Recipe"
    Then I should see "Your recipe has been posted"
    And I should be on the show recipe page
    And I should see "Hot Chicken"
    And I should see "30 min."
    And I should see "1. Fry chicken and douse in hot sauce 2. Enjoy!"



