@events
Feature: Events
  In order to have events on my website
  As an administrator
  I want to manage events

  Background:
    Given I am a logged in refinery user
    And I have no events

  @events-valid @valid
  Scenario: Create Valid Event
    When I go to the list of events
    And I follow "Add New Event"
    And I fill in "Titre" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 event

  @events-invalid @invalid
  Scenario: Create Invalid Event (without titre)
    When I go to the list of events
    And I follow "Add New Event"
    And I press "Save"
    Then I should see "Titre can't be blank"
    And I should have 0 events
