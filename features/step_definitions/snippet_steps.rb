Then /there should be "([^\"]*)" html-escaped/ do |text|
  response.should have_text(/#{ERB::Util.html_escape(text)}/)
end