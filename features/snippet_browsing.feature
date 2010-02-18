Feature: developer browses list of snippets
  In order to see what others are doing
  As a developer with lots of free time
  I want to be able to browse the snippets

  Scenario: Browse
    Given 10 snippets exist
    When I go to the snippets page
    Then I should see exactly 10 snippets

  Scenario: Ordered list of snippets
    Given a snippet created after another
    When I go to the snippets page
    Then I should see the newest snippet at the top

  Scenario: Browse with Pagination
    Given 11 snippets exist
    When I go to the snippets page
    Then I should see exactly 10 snippets
    And I should see "Next" within ".pagination"

  Scenario: Browsing beyond the first page
    Given 12 snippets exist
    When I go to the snippets page
    And I follow "Next"
    Then I should see exactly 2 snippets
    And I should see "Previous" within ".pagination"

  Scenario: Browsing lists only the first 3 lines of each snippet
    Given a snippet exists with "code":
    """
    FirstLine
    SecondLine
    ThirdLine
    FourthLine
    """
    When I go to the snippets page
    Then I should not see "FourthLine"