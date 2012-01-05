#Given /^an opening exists called "([^"]*)", objective: "([^"]*)"$/ do |opening_name, objective_text, skills_text, grizzard_text|
#	Opening.create!(name: opening_name, objective: objective_text, skills: skills_text, grizzard: grizzard_text) 
#end

Given /^an opening exists called "([^"]*)", objective: "([^"]*)", grizzard: "([^"]*)", skills: "([^"]*)"$/ do |opening_name, objective_text, grizzard_text, skills_text|
  Opening.create!(name: opening_name, objective: objective_text, skills: skills_text, grizzard: grizzard_text) 
end


When /^I go to the path "([^"]*)"$/ do |path|
	visit(path)
end

Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content(text)
end

