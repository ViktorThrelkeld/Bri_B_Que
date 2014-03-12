
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
  @javascript
  Scenario: User can create a recipe with a title, prep time and instructions succeeds
    Given the following user:
      | username              | joe             |
      | email                 | joe@example.com |
    And that user has the following profile:
      | bio            |MY PROFILE|
      |hometown | smalltown, IN |
      |age | 25 |
    When I sign in
    When I follow "My Profile"
    Then I should be on my profile page
    When I follow "New Recipe"
    Then I should be on the create a recipe page
    When I fill in "Hot Chicken" for "Title"
    And I fill in "yum" for "Description"
    And I fill in "2" for "Servings"
    And I fill in "30 min." for "Prep time"
    And I fill in "10 min." for "Cook time"
    And I fill in "1. Fry chicken and douse in hot sauce 2. Enjoy!" for "Instructions"
    And I fill in "1/2 cup" for "Quantity"
    And I follow "Create A New Ingredient"
    And I fill in "salt" for "Ingredient name"
    And I press "Post Recipe"
    Then I should see "Your recipe has been posted"
    And I should be on the show recipe page
    And I should see "Hot Chicken"
    And I should see "yum"
    And I should see "2"
    And I should see "30 min."
    And I should see "10 min."
    And I should see "1. Fry chicken and douse in hot sauce 2. Enjoy!"
    And I should see "1/2 cup salt"

  Scenario: User can see Recipes listed on My Profile
    Given the following user:
      | username              | joe             |
      | email                 | joe@example.com |
    And that user has the following profile:
      | bio            |MY PROFILE|
      |hometown | smalltown, IN |
      |age | 25 |
    And that user has the following recipe:
      |title        | Ribs|
      |prep_time    | 1 hrs. |
      |cook_time    | 5 hrs  |
      |description  | delicious |
      |servings     | 3 |
      |instructions |smoke 'em if u got 'em|
      And that user has the following recipe:
      |title        | Hot Chicken|
      |prep_time    | 30 min.    |
      |instructions |Fry and eat |
      |cook_time    | 10 min hrs  |
      |description  | delicious |
      |servings     | 3 |
    When I sign in
    When I follow "My Profile"
    Then I should be on my profile page
    And I should see "Ribs"
    And I should see "Hot Chicken"
    When I follow "Hot Chicken"
    Then I should see "Hot Chicken"
    And I should see "Fry and eat"
    And I should see "30 min"
    And I should see "10 min"
    And I should see "delicious"
    And I should see "3"

  Scenario: User can edit Recipes listed on My Profile
    Given the following user:
      | username              | joe             |
      | email                 | joe@example.com |
    And that user has the following profile:
      | bio            |MY PROFILE|
      |hometown | smalltown, IN |
      |age | 25 |
    And that user has the following recipe:
      |title        | Ribs|
      |prep_time    | 5 hrs. |
      |instructions |smoke 'em if u got 'em|
      |cook_time    | 5 hrs  |
      |description  | delicious |
      |servings     | 3 |
      When I sign in
    When I follow "My Profile"
    Then I should be on my profile page
    And I should see "Ribs"
    And I follow "Edit"
    Then I should see "Edit Recipe"
    When I fill in "Hot Chicken" for "Title"
    And I press "Update Recipe"
    Then I should be on the show recipe page
    And I should see "Hot Chicken"
    And I should see "5 hrs."

  Scenario: User can delete Recipes listed on My Profile
    Given the following user:
      | username              | joe             |
      | email                 | joe@example.com |
    And that user has the following profile:
      | bio            |MY PROFILE|
      |hometown | smalltown, IN |
      |age | 25 |
    And that user has the following recipe:
      |title        | Ribs|
      |prep_time    | 5 hrs. |
      |instructions |smoke 'em if u got 'em|
      |cook_time    | 5 hrs  |
      |description  | delicious |
      |servings     | 3 |
    When I sign in
    When I follow "My Profile"
    Then I should be on my profile page
    And I should see "Ribs"
    And I follow "Delete"
    Then I should be on my profile page
    And I should see "Your recipe has been deleted"
    And I should not see "Ribs"