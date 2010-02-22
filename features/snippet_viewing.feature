Feature: viewer sees snippet
  In order to see how totally awesome my friend is
  As a viewer
  I want to be able to retrieve a specific snippet based on its id

  Scenario: View snippet
    Given a snippet exists with "code":
    """
    class ApplicationController < ActionController::Base
      helper :all # include all helpers, all the time
      protect_from_forgery
      filter_parameter_logging :password
    end
    """
    When I go to that snippet's page
    Then I should see:
    """
    class ApplicationController < ActionController::Base
      helper :all # include all helpers, all the time
      protect_from_forgery
      filter_parameter_logging :password
    end
    """

  Scenario: Escaped HTML
    Given a language exists with parser: "plain_text"
    And a snippet exists with code: "<dummyml> &", language: the language
    When I go to that snippet's page
    Then I should see "<dummyml> &"
    And there should be "<dummyml> &" html-escaped
