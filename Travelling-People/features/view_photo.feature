Feature: I want to view photo information
  As a visitor
  I want to have a photo display page
  so that I can see the informations of the photo

  Scenario: view photo
    Given I am a visitor
    When I go to a photo page
    Then I should see informations of the photo
