Feature: Existing User creates and manages entities
  In order to create new entities that belong to one person
  As a user of oozakazoo  
  I want to create and manage entities

  
  Scenario: Entity List
    Given I am an existing user named "robb"
    And I have entities titled Cat, Dog 
    When I go to the list of entities
    Then I should see "Cat"
    And "Cat" should be linked to user "robb"
    And I should see "Dog"
    And "Dog" should be linked to user "robb"
  
  Scenario: Create Valid Entity
    Given I have no entities
    And I am on the list of entities
    And I am an existing user named  "robb"
    When I follow "Create Entity"
    And I fill in "Title" with "Cat"
    And I fill in "Content" with "This is a furry little cat!"
    And I press "Create"
    Then I should see "Entity Created"
    And I should see "Cat"
    And I should see "This is a furry little cat!"
    And I should see a UUID
    And I should have 1 entity
  
  
  
  
  
  
  
  
  

