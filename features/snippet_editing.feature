Feature: developer edits snippet
  In order to fix a mistake in a shared piece of code
  As a software developer
  I want to be able to change an existing snippet

  Scenario: Edit snippet
    Given a snippet exists with code: "<?php die('OMG, they killed Kenny!'); ?>"
    When I go to that snippet page
    And I follow "Edit"
    Then I should be on the snippet's edit page
    And I should see "<?php die('OMG, they killed Kenny!'); ?>"

  Scenario: Update Snippet
    Given a snippet exists with code: "<?php die('OMG, they killed Kenny!'); ?>"
    When I go to the snippet's edit page
    And I fill in "snippet_code" with "<?php echo 'Screw you guys ...I'm going home!'; die; ?>"
    And I press "Update Snippet"
    Then I should see "Snippet was successfully updated."
    And I should see "<?php echo 'Screw you guys ...I'm going home!'; die; ?>"