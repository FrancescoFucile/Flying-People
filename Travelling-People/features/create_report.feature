Feature: I want to create a new report
    As a user
    I want to write a report
    So that I can publish a report 

Background: Create report
Given I am a logged-in user
When I press "Pubblica un nuovo report"
Then I should be on an empty report editing interface

Scenario: Write report
When I fill in "Title" with "my title"
And I fill in "Locality" with "Rome"
And I fill in "Report" with "lorem ipsum"
And I press "Publish"
Then I should be on the new report page with title "my title"