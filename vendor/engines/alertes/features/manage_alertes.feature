@alertes
Feature: Alertes
  In order to have alertes on my website
  As an administrator
  I want to manage alertes

  Background:
    Given I am a logged in refinery user
    And I have no alertes

  @alertes-list @list
  Scenario: Alertes List
   Given I have alertes titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of alertes
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @alertes-valid @valid
  Scenario: Create Valid Alerte
    When I go to the list of alertes
    And I follow "Add New Alerte"
    And I fill in "Titre" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 alerte

  @alertes-invalid @invalid
  Scenario: Create Invalid Alerte (without titre)
    When I go to the list of alertes
    And I follow "Add New Alerte"
    And I press "Save"
    Then I should see "Titre can't be blank"
    And I should have 0 alertes

  @alertes-edit @edit
  Scenario: Edit Existing Alerte
    Given I have alertes titled "A titre"
    When I go to the list of alertes
    And I follow "Edit this alerte" within ".actions"
    Then I fill in "Titre" with "A different titre"
    And I press "Save"
    Then I should see "'A different titre' was successfully updated."
    And I should be on the list of alertes
    And I should not see "A titre"

  @alertes-duplicate @duplicate
  Scenario: Create Duplicate Alerte
    Given I only have alertes titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of alertes
    And I follow "Add New Alerte"
    And I fill in "Titre" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 alertes

  @alertes-delete @delete
  Scenario: Delete Alerte
    Given I only have alertes titled UniqueTitleOne
    When I go to the list of alertes
    And I follow "Remove this alerte forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 alertes
 