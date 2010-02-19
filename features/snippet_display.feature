Feature: Display snippets with nice formatting
  In order to easily understand source code
  As a spoiled reader of source code
  I want to see syntax coloring, line numbering, and pretty formatting

  Background:
    Given a language: "Ruby" exists with name: "Ruby", parser: "ruby"
    And a language: "PHP" exists with name: "PHP", parser: "php"

  Scenario: Syntax coloring when viewing snippet: ruby
    Given a snippet exists with code: "def greet(param); 'hello, world!'.capitalize end", language: language "Ruby"
    When I go to that snippet page
    Then I should see the snippet syntax-colored properly in "Ruby"

  Scenario: Syntax coloring when viewing snippet: php
    Given a snippet exists with code: "<?php foreach($param) { strtoupper('hello, world!'); } ?>", language: language "PHP"
    When I go to that snippet page
    Then I should see the snippet syntax-colored properly in "PHP"

  Scenario: Syntax coloring when Browsing
    Given a snippet exists with code: "def greet(param); 'hello, world!'.capitalize end", language: language "Ruby"
    And a snippet exists with code: "<?php foreach($param) { strtoupper('hello, world!'); } ?>", language: language "PHP"
    When I go to the snippets page
    Then I should see the snippet syntax-colored properly in "Ruby"
    And I should see the snippet syntax-colored properly in "PHP"

  Scenario: Line numbering when browsing
    Given a snippet exists with "code":
    """
    first
    second
    third
    """
    When I go to the snippets page
    Then I should see:
    """
       1
       2
       3
    """
    And I should see:
    """
    first
    second
    third
    """
  Scenario: Line numbering when viewing snippet
    Given a snippet exists with "code":
    """
    first
    second
    third
    """
    When I go to that snippet page
    Then I should see:
    """
       1
       2
       3
    """
    And I should see:
    """
    first
    second
    third
    """

  Scenario: Keeps formatting intact when browsing
    Given a snippet exists with "code":
    """
    unindented   3s
      2spaces
    unindented  2s
        4spaces
    """
    When I go to the snippets page
    Then I should see:
    """
    unindented   3s
      2spaces
    unindented  2s
    """
  Scenario: Keeps formatting intact when viewing snippet
    Given a snippet exists with "code":
    """
    unindented   3s
      2spaces
    unindented  2s
        4spaces
    """
    When I go to that snippet page
    Then I should see:
    """
    unindented   3s
      2spaces
    unindented  2s
        4spaces
    """