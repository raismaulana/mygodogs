# file: health-check.feature
Feature: get health check
  In order to know server is good
  As an API user
  I need to know if the server is in good condition by sending request

  Scenario: does not allow POST method
    When I send "POST" request to "/health-check"
    Then the response code should be 405
    And the response should match json:
      """
      {
        "error": "Method not allowed"
      }
      """

  Scenario: should get status ok
    When I send "GET" request to "/health-check"
    Then the response code should be 200
    And the response should match json:
      """
      {
        "status": "OK"
      }
      """