Feature: I want to change my profile information
	As a user 
	I want to have a profile edit interface 
	so that I can  modify my username

Background: change information
	Given I am a logged-in user
	When I press "Modifica"
	Then I should be on my profile edit interface


Scenario: change username
	When I fill in "Username" with "new"
	And I fill in "password" with my password
	And I press "Salva modifiche"
	Then I should be on my profile page
	And I should see "Your account has been updated successfully."
	And I should see "Nome utente: new"

Scenario: change description
	When I fill in "Descrizione" with "new description"
	And I fill in "password" with my password
	And I press "Salva modifiche"
	Then I should be on my profile page
	And I should see "Your account has been updated successfully."
	And I should see "Descrizione: new description"
