Feature: Homepage
  In order to easily share short amounts of code with colleagues without having to cut+paste it into MSN
  As a new user
  I want to see clear and intuitive ways to use the site to rapidly create and share snippets

  Scenario: Visiting the homepage
    When I go to the homepage
    Then I should see a "snippet_code" field
    And I should see a "snippet_language_id" field
    And I should see a "Create Snippet" button

  Scenario: Create snippet
    Given a language exists with name: "Ruby"
    When I go to the home page
    And I select "Ruby" from "snippet_language_id"
    And I fill in "snippet_code" with "<%= [1,3,5].map{|i| i+1}.to_s %>"
    And I press "Create"
    Then a snippet should exist with code: "<%= [1,3,5].map{|i| i+1}.to_s %>"
    And I should be on that snippet page
    And I should see "<%= [1,3,5].map{|i| i+1}.to_s %>"

  Scenario: Go to Browse snippets
    When I go to the homepage
    And I follow "Browse"
    Then I should be on the snippets page