@colloques
Feature: Colloques
  In order to have colloques on my website
  As an administrator
  I want to manage colloques

  Background:
    Given I am a logged in refinery user
    And I have no colloques

  @colloques-list @list
  Scenario: Colloques List
   Given I have colloques titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of colloques
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @colloques-valid @valid
  Scenario: Create Valid Colloque
    When I go to the list of colloques
    And I follow "Add New Colloque"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 colloque

  @colloques-invalid @invalid
  Scenario: Create Invalid Colloque (without title)
    When I go to the list of colloques
    And I follow "Add New Colloque"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 colloques

  @colloques-edit @edit
  Scenario: Edit Existing Colloque
    Given I have colloques titled "A title"
    When I go to the list of colloques
    And I follow "Edit this colloque" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of colloques
    And I should not see "A title"

  @colloques-duplicate @duplicate
  Scenario: Create Duplicate Colloque
    Given I only have colloques titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of colloques
    And I follow "Add New Colloque"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 colloques

  @colloques-delete @delete
  Scenario: Delete Colloque
    Given I only have colloques titled UniqueTitleOne
    When I go to the list of colloques
    And I follow "Remove this colloque forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 colloques
 