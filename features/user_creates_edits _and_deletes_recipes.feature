
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

  Scenario: User can create a recipe with a title, prep time and instructions succeeds
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
    When I fill in "Hot Chicken" for "Title"
    And I fill in "30 min." for "Prep time"
    And I fill in "1. Fry chicken and douse in hot sauce 2. Enjoy!" for "Instructions"
    And I press "Post Recipe"
    Then I should see "Your recipe has been posted"
    And I should be on the show recipe page
    And I should see "Hot Chicken"
    And I should see "30 min."
    And I should see "1. Fry chicken and douse in hot sauce 2. Enjoy!"

  Scenario: User can see Recipes listed on My Profile
    Given the following user:
      | username              | joe             |
      | email                 | joe@example.com |
    And that user has the following profile:
      | bio            |MY PROFILE|
    And that user has the following recipe:
      |title        | Ribs|
      |prep_time    | 5 hrs. |
      |instructions |smoke 'em if u got 'em|
      And that user has the following recipe:
      |title        | Hot Chicken|
      |prep_time    | 30 min.    |
      |instructions |Fry and eat |
    When I sign in
    When I follow "My Profile"
    Then I should be on my profile page
    And I should see "Ribs"
    And I should see "Hot Chicken"

  Scenario: User can edit Recipes listed on My Profile
    Given the following user:
      | username              | joe             |
      | email                 | joe@example.com |
    And that user has the following profile:
      | bio            |MY PROFILE|
    And that user has the following recipe:
      |title        | Ribs|
      |prep_time    | 5 hrs. |
      |instructions |smoke 'em if u got 'em|
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
    And that user has the following recipe:
      |title        | Ribs|
      |prep_time    | 5 hrs. |
      |instructions |smoke 'em if u got 'em|
    When I sign in
    When I follow "My Profile"
    Then I should be on my profile page
    And I should see "Ribs"
    And I follow "Delete"
    Then I should be on my profile page
    And I should see "Your recipe has been deleted"
    And I should not see "Ribs"