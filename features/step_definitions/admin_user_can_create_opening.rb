Given /^I go to the new openings page$/ do
  visit(new_opening_path)
end

Given /^I fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

Given /^I (?:click|press) "(.*?)"$/ do |link_text|
  click_link_or_button link_text
end

Then /^I should be on the opening show page$/ do
  opening = Opening.find(params[:id])
  visit(opening_path(opening))
end
