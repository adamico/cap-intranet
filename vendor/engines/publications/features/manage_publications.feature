@publications
Feature: Publications
  In order to have publications on my website
  As an administrator
  I want to manage publications

  Background:
    Given I am a logged in refinery user
    And I have no publications

  @publications-list @list
  Scenario: Publications List
   Given I have publications titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of publications
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @publications-valid @valid
  Scenario: Create Valid Publication
    When I go to the list of publications
    And I follow "Add New Publication"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 publication

  @publications-invalid @invalid
  Scenario: Create Invalid Publication (without title)
    When I go to the list of publications
    And I follow "Add New Publication"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 publications

  @publications-edit @edit
  Scenario: Edit Existing Publication
    Given I have publications titled "A title"
    When I go to the list of publications
    And I follow "Edit this publication" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of publications
    And I should not see "A title"

  @publications-duplicate @duplicate
  Scenario: Create Duplicate Publication
    Given I only have publications titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of publications
    And I follow "Add New Publication"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 publications

  @publications-delete @delete
  Scenario: Delete Publication
    Given I only have publications titled UniqueTitleOne
    When I go to the list of publications
    And I follow "Remove this publication forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 publications
 