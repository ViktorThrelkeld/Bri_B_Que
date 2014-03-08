@wip
Feature: Create a recipe
  In order to share and compare recipes
  As a Barbeque enthusiast
  I want to post my recipes


  Scenario: User can create ingredients
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
    # When I follow "New Ingredient"
    # Then I should be on create an ingredient page
    # And I should see "Name"
    # When I fill in "salt" for "Name"
    # And I press "Post Ingredient"
    # Then I should be on show ingredients page
    # And I should see "salt"
    # And I should see "Edit"
    # And I should see "Delete"

  Scenario: User can edit ingredients
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
      # When I follow "New Ingredient"
      # Then I should be on create an ingredient page
      # And I should see "Name"
      # When I fill in "salt" for "Name"
      # And I press "Post Ingredient"
      # Then I should be on show ingredients page
      # And I should see "salt"
      # When I follow "Edit"
      # Then I should see "salt"
      # When I fill in "pepper" for "Name"
      # And I press "Update Ingredient"
      # Then I should be on show ingredients page
      # And I should see "pepper"





  Scenario: User can delete ingredients
    Given the following user:
      | username              | joe             |
      | email                 | joe@example.com |
    And that user has the following profile:
      | bio            |MY PROFILE|
      |hometown | smalltown, IN |
      |age | 25 |
    # And that user has the following ingredient:
    #   |name   | salt |
      When I sign in
      When I follow "My Profile"
      Then I should be on my profile page
      # When I follow "New Ingredient"
      # Then I should be on create an ingredient page
      # And I should see "Name"
      # When I fill in "salt" for "Name"
      # And I press "Post Ingredient"
      # Then I should be on show ingredients page
      # And I should see "salt"
      # And I should see "Edit"
      # And I press "Delete"
      # And I should see "Your ingredient has been deleted"
      # And I should not see "salt"