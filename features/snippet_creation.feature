#Feature: developer creates snippet
#  In order to show pieces of code to a friend for collaboration
#  As a software developer
#  I want to be able to create a snippet
#
#  Scenario: New snippet form
#    Given a language exists with name: "Ruby"
#    And a language exists with name: "Python"
#    When I go to the new snippet page
#    Then I should see "Ruby"
#    And I should see "Python"
#    And the "code" field should contain ""
#
#  Scenario: Create snippet
#    Given a language exists with name: "Ruby"
#    And a language exists with name: "Python"
#    When I go to the new snippet page
#    And I select "Ruby" from "Language"
#    And I fill in "Code" with "puts 'Hello World'"
#    And I press "Create"
#    Then I should be on that snippet page
#    And I should see "Snippet was successfully created"
#    And I should see "Ruby"
#    And I should see "puts 'Hello World'"
#
