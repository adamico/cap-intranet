@enquetes
Feature: Enquetes
  In order to have enquetes on my website
  As an administrator
  I want to manage enquetes

  Background:
    Given I am a logged in refinery user
    And I have no enquetes

  @enquetes-list @list
  Scenario: Enquetes List
   Given I have enquetes titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of enquetes
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @enquetes-valid @valid
  Scenario: Create Valid Enquete
    When I go to the list of enquetes
    And I follow "Add New Enquete"
    And I fill in "Titre" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 enquete

  @enquetes-invalid @invalid
  Scenario: Create Invalid Enquete (without titre)
    When I go to the list of enquetes
    And I follow "Add New Enquete"
    And I press "Save"
    Then I should see "Titre can't be blank"
    And I should have 0 enquetes

  @enquetes-edit @edit
  Scenario: Edit Existing Enquete
    Given I have enquetes titled "A titre"
    When I go to the list of enquetes
    And I follow "Edit this enquete" within ".actions"
    Then I fill in "Titre" with "A different titre"
    And I press "Save"
    Then I should see "'A different titre' was successfully updated."
    And I should be on the list of enquetes
    And I should not see "A titre"

  @enquetes-duplicate @duplicate
  Scenario: Create Duplicate Enquete
    Given I only have enquetes titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of enquetes
    And I follow "Add New Enquete"
    And I fill in "Titre" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 enquetes

  @enquetes-delete @delete
  Scenario: Delete Enquete
    Given I only have enquetes titled UniqueTitleOne
    When I go to the list of enquetes
    And I follow "Remove this enquete forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 enquetes
 