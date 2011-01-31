@documents
Feature: Documents
  In order to have documents on my website
  As an administrator
  I want to manage documents

  Background:
    Given I am a logged in refinery user
    And I have no documents

  @documents-list @list
  Scenario: Documents List
   Given I have documents titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of documents
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @documents-valid @valid
  Scenario: Create Valid Document
    When I go to the list of documents
    And I follow "Add New Document"
    And I fill in "Titre" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 document

  @documents-invalid @invalid
  Scenario: Create Invalid Document (without titre)
    When I go to the list of documents
    And I follow "Add New Document"
    And I press "Save"
    Then I should see "Titre can't be blank"
    And I should have 0 documents

  @documents-edit @edit
  Scenario: Edit Existing Document
    Given I have documents titled "A titre"
    When I go to the list of documents
    And I follow "Edit this document" within ".actions"
    Then I fill in "Titre" with "A different titre"
    And I press "Save"
    Then I should see "'A different titre' was successfully updated."
    And I should be on the list of documents
    And I should not see "A titre"

  @documents-duplicate @duplicate
  Scenario: Create Duplicate Document
    Given I only have documents titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of documents
    And I follow "Add New Document"
    And I fill in "Titre" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 documents

  @documents-delete @delete
  Scenario: Delete Document
    Given I only have documents titled UniqueTitleOne
    When I go to the list of documents
    And I follow "Remove this document forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 documents
 