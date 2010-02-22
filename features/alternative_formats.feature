Feature: Snippets in html-free formats
  In order to use snippets from other programs
  As a user sharing snippets
  I want to have access to machine-friendly versions of the snippets

  Scenario: acessing a snippet in text format
    Given a snippet exists with code: "3.times { puts 'Hello World!' }"
    When I go to the snippet text format page
    Then the response should be exactly "3.times { puts 'Hello World!' }"

  Scenario: acessing the raw snippet from a link
    Given a snippet exists with "code":
    """
    10.times{ |i|
      puts '#{i}: Hello World!'
    }
    """
    When I go to the snippet page
    And I follow "Raw"
    Then I should be on the snippet text format page
    And the response should be exactly:
    """
    10.times{ |i|
      puts '#{i}: Hello World!'
    }
    """

  Scenario: acessing a snippet in JSON format
    Given a language exists with name: "Ruby On Rails", parser: "ruby_on_rails"
    And a snippet exists with code: "3.times { puts 'Hello World!' }", language: the language
    When I go to the snippet json format page
    Then I should see "3.times { puts 'Hello World!' }"
    And I should see "snippet"
    And I should see "updated_at"
    And I should see "code"
    And I should see "Ruby On Rails"
    And I should not see "language_id"