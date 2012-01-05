Feature: Visitor can view an opening
	In order to see just the resume tailored to this position
	As a visitor
	I want to see a vitae at a specific URL
	
Scenario: normal
	Given an opening exists called "Swingpal", objective: "Work here", grizzard: "My experience", skills: "My skills"
	When I go to the path "/openings/swingpal"
	
	Then I should see "Sam Walton"
	Then I should see "Work here"
	Then I should see "My experience"
	Then I should see "My skills"