Feature: developer edits snippet
  In order to fix a mistake in a snippet and still not fear others messing with my snippets
  As a paranoid software developer
  I want to be the only one able to edit the snippets I create

  Scenario: Edit my snippet
    Given a language exists
    When I go to the new snippet page
    And I fill in "snippet_code" with "<?php die('OMG, they killed Kenny!'); ?>"
    And I press "Create"
    And I follow "Edit"
    Then I should be on the edit snippet page
    And I should see "<?php die('OMG, they killed Kenny!'); ?>"

  Scenario: Update my snippet
    Given a language exists
    When I go to the new snippet page
    And I fill in "snippet_code" with "<?php die('OMG, they killed Kenny!'); ?>"
    And I press "Create"
    And I follow "Edit"
    And I fill in "snippet_code" with "<?php echo 'Screw you guys ...I'm going home!'; die; ?>"
    And I press "Update Snippet"
    Then I should see "Snippet was successfully updated."
    And a snippet should exist with code: "<?php echo 'Screw you guys ...I'm going home!'; die; ?>"
    And a snippet should not exist with code: "<?php die('OMG, they killed Kenny!'); ?>"
    And I should see "<?php echo 'Screw you guys ...I'm going home!'; die; ?>"

  Scenario: Destroy my snippet
    Given a language exists
    When I go to the new snippet page
    And I fill in "snippet_code" with "<?php die('OMG, they killed Kenny!'); ?>"
    And I press "Create"
    And I follow "Destroy"
    Then I should be on the snippets page
    And a snippet should not exist with code: "<?php die('OMG, they killed Kenny!'); ?>"

  Scenario: No edit or destroy links on other people's snippets
    Given a snippet exists
    When I go to that snippet page
    Then I should not see "Edit"
    And I should not see "Destroy"

  Scenario: Not allowed to edit somebody else's snippets
    Given a snippet exists
    When I go to that snippet's edit page
    Then I should see "Sorry, you can't do that!"
    And I should be on that snippet page
    