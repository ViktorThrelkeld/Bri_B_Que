Feature: Create a recipe
  In order to share and compare recipes
  As a Barbeque enthusiast
  I want to post my recipes

  @focus
  Scenario: User can create ingredients
    Given the following user:
      | username              | joe             |
      | email                 | joe@example.com |
    And that user has the following profile:
      | bio            |MY PROFILE|
    When I sign in
    When I follow "My Profile"
    Then I should be on my profile page
    When I follow "New Recipe"
    Then I should be on the create a recipe page
    And I should see "Name"
    When I fill in "salt" for "Name"
    And I press "Post Ingredient"
    Then I should be on show ingredients page