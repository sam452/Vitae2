Given /^I go to the new openings page$/ do
  visit(post_openings_path(post))
end

Given /^I fill in "([^"]*)" with "([^"]*)"$/ do |arg1, arg2|
  #pending # express the regexp above with the code you wish you had
  fill_in('Name', :with => 'Walmart')
  fill_in('Company', :with => 'Wal-mart')
  fill_in('objective', :with => 'Be a nice greeter.')
  fill_in('grizzard', :with => 'one. two.')
  fill_in('Skills', :with => 'three. four')
end

Then /^I should be on the opening show page$/ do
  visit('/openings#show')
  #pending # express the regexp above with the code you wish you had
end
