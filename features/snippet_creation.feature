Feature: developer creates snippet
  In order to show pieces of code to a friend for collaboration
  As a software developer
  I want to be able to create a snippet

  Scenario: Allows selecting language
    Given a language exists with name: "Ruby"
    And a language exists with name: "Python"
    When I go to the new snippet page
    Then I should see "Ruby"
    And I should see "Python"

  Scenario: Create snippet
    Given a language exists with name: "Ruby"
    And a language exists with name: "Python"
    When I go to the new snippet page
    And I select "Ruby" from "snippet_language_id"
    And I fill in "snippet_code" with:
    """
    <%
      def format_name name
        name.strip.capitalize
      end
    %>
    
    <%= list.reject{|x| x < 10 }.map{|x| x + 5 }.join(' -> ') %>
    """
    And I press "Create"
    Then I should be on the newly created snippet page
    And I should see "Snippet was successfully created"
    And I should see "Ruby"
    And I should see:
    """
    <%
      def format_name name
        name.strip.capitalize
      end
    %>

    <%= list.reject{|x| x < 10 }.map{|x| x + 5 }.join(' -> ') %>
    """
    

