Given /^I go to the new openings page$/ do
  visit(new_opening_path)
end

Given /^I fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

Then /^I should be on the opening show page$/ do
  opening = Opening.find(params[:id])
  visit(opening_path(opening))
end
