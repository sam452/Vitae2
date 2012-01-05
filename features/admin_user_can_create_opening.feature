@create
Feature: Administrator can create and edit and destroy an opening
	In order to create an opening
	As an Administrator
	I want to see a page to create an opening
	
Scenario: normal
	Administrator adds a new opening
	Given I go to the new openings page
	And I fill in "Name" with "Walmart"
	And I fill in "Company" with "Wal-mart"
	And I fill in "Objective" with "Be a nice greeter."
	And I fill in "Grizzard" with "one. two."
	And I fill in "experience" with "three. four"
	Then I should be on the opening show page
	And I should see "Be a nice greeter."
	And I should see "one. two."
	And I should see "three. four"