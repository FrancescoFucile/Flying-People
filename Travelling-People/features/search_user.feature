Feature: I want to search an other user by username
	As a user
	I want to search an other user by username
	so that I can see his profile


Background: search users 
	Given I am logged-in


Scenario: user found
	Given "correctUser" is registered
	When I fill in "Cerca utente" with "correctUser"
	And I press "Cerca" 
	Then I should see "correctUser"
	And I should see "correctUser description"
	

Scenario: user not found
	When I fill in "Cerca utente" with "uncorrectUser"
	And I press "Cerca" 
	Then I should be on my profile page
	And I should see "Utente inesistente!"
   
