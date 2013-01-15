@create
Feature: Administrator can create and edit and destroy an opening
	In order to create an opening
	As an Administrator
	I want to see a page to create an opening
	
Scenario: normal
	Administrator adds a new opening
	Given I go to the new openings page
	And I fill in "Company" with "Wal-mart"
	And I fill in "Objective" with "Be a nice greeter."
	And I fill in "Grizzard" with "one. two."
	And I fill in "skills" with "three. four"
	And I press "Create Opening"
	Then I should see "Be a nice greeter."
	And show me the page
	And I should see "one. two."
	And I should see "Skills"
