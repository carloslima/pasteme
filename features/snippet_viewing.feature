#Feature: viewer sees snippet
#  In order to see how totally awesome my friend is
#  As a viewer
#  I want to be able to retrieve a specific snippet based on its id
#
#  Scenario: View snippet
#    Given a snippet exists with code:
#    """
#    class ApplicationController < ActionController::Base
#      helper :all # include all helpers, all the time
#      protect_from_forgery
#      filter_parameter_logging :password
#    end
#    """
#    When I go to the show page for that snippet
#    Then I should see
#    """
#      class ApplicationController < ActionController::Base
#        helper :all # include all helpers, all the time
#        protect_from_forgery
#        filter_parameter_logging :password
#      end
#    """
#    And I should see "Edit"
#
#  Scenario: Escape HTML
#    Given a snippet exists with code: "<dummyml>& "
#    When I go to the show page for that snippet
#    Then the output should be properly escaped for HTML