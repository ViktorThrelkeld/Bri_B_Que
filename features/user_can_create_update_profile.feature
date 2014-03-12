
Feature: Create and update profile
  In order to share and compare recipes
  As a Barbeque enthusiast
  I want to create and update my profile

  Scenario: User creates profile
    When I sign up
    Then I should be on the create a profile page
    Then I should see "Create A Profile"
    And I fill in "BBQ Ambassador. Walks On the Beach." for "Bio"
    And I fill in "smalltown, IN" for "Hometown"
    And I fill in "45" for "Age"
    And I press "Create Profile"
    And I should see "BBQ Ambassador"
    And I should see "smalltown, IN"
    And I should see "45"

  Scenario: User edits profile
    Given the following user:
      | username              | joe             |
      | email                 | joe@example.com |
    And that user has the following profile:
      | bio            |MY PROFILE|
      |hometown | Nashville,TN |
      |age | 35 |
    When I go to the homepage
    And I follow "Sign In"
    And I fill in "joe@example.com" for "Email"
    And I fill in "password" for "Password"
    And I press "Sign in"
    Then I should see "Signed in successfully."
    And I should be on the homepage
    And I should see "My Profile"
    When I follow "My Profile"
    Then I should be on my profile page
    When I press "Update Profile"
    Then I should be on update profile page
    Then I should see "Update Profile"
    And I fill in "Backyard Smoker" for "Bio"
    And I press "Update Profile"
    Then I should see "My Profile"
    And I should see "Backyard Smoker"
    And I should see "Nashville,TN"
    And I should see "35"