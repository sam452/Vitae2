@index
Feature: Visitor will view root
	Without an existing opening a visitor will see root
	As a Visitor
	I cannot see an opening that does not exist
	
Scenario: normal
	Given an opening does not exist called "Acme"
	When I go to the path "/openings/acme"
	
	# Josh note: cucumber can't test for files names rendered--it can only see what a user would see
  # Then I should see index.html
	
	Then I should see "Sam W. Walton"
