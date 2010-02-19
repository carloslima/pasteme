Then /there should be "([^\"]*)" html-escaped/ do |text|
  response.should have_text(/#{ERB::Util.html_escape(text)}/)
end

Then /^I should see exactly (\d+) snippets$/ do |count|
  response.should have_tag "#snippets" do
    with_tag ".snippet", :count => count.to_i
  end
end

Given /^a snippet created after another$/ do
  Factory(:snippet, :code=>"oldest!", :updated_at => 5.seconds.ago)
  Factory(:snippet, :code=>'newest!', :updated_at => 1.seconds.ago)
end

Then /^I should see the newest snippet at the top$/ do
  response.should have_tag '#snippets' do
    with_tag '#snippet_0', /newest!/
    with_tag '#snippet_1', /oldest!/
  end
end

Then /I should see the snippet syntax-colored properly in "([^\"]*)"/ do |language|
  response.should have_selector('pre.slush_poppies') do |pre|
    pre.should have_selector('span.String') do |content|
      content.should contain("hello, world!")
    end
    pre.should have_selector('span.Variable') do |content|
      content.should contain("param")
    end
    case language
      when "Ruby":
        pre.should have_selector('span.Keyword') do |content|
          content.should contain("def")
        end
        pre.should have_selector('span.FunctionName') do |content|
          content.should contain("capitalize")
        end

      when "PHP":
        pre.should have_selector('span.Keyword') do |content|
          content.should contain("foreach")
        end
        pre.should have_selector('span.LibraryFunction') do |content|
          content.should contain("strtoupper")
        end
    end
  end
end