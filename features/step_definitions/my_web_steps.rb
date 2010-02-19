Then /^I should see a "([^\"]*)" field$/ do |field|
  field_labeled(field).should_not be_nil
end

Then /^I should see a "([^\"]*)" button$/ do |button_text|
  response.should have_tag("input[type='submit'][value='#{button_text}']")
end

When /^I fill in "([^\"]*)" with:$/ do |name, value|
  When %{I fill in "#{name}" with "#{value}"}
end