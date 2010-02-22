Then /^I should see a "([^\"]*)" field$/ do |field|
#  field_labeled(field).should_not be_nil
  fill_in(field,"")
end

Then /^I should see a "([^\"]*)" button$/ do |button_text|
  response.should have_tag("input[type='submit'][value='#{button_text}']")
end

When /^I fill in "([^\"]*)" with:$/ do |name, value|
  When %{I fill in "#{name}" with "#{value}"}
end

Then /^I should see:$/ do |text|
  Then %{I should see "#{text}"}
end

Given /^#{capture_model} exists with "([^\"]*)":$/ do |model_name, field_name, field_value|
  create_model(model_name, {field_name => field_value})
end

Then /^the response should be exactly "([^\"]*)"$/ do |text|
  response.body.should == text
end
Then /^the response should be exactly:$/ do |text|
  Then %{the response should be exactly "#{text}"}
end