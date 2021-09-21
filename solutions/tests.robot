*** Settings ***
Resource         resources.resource
Test Setup       Workshop Setup
Suite Teardown   Workshop Teardown 


*** Test Cases ***
Exercise 1 - Use the BrowserLibrary to fill in the form
    When I Input The First Name     Test
    And I Input The Last Name       User
    And I Click The Submit Button
    Then The Output Element Should Contain   Test User

Exercise 2 - Stub the POST /signup response
    When Stub Endpoint And Return File      /signup     ${CURDIR}/stub_response.json
    And I Input The First Name      Test
    And I Input The Last Name       User
    And I Click The Submit Button
    Then The Output Element Should Contain      I'm a stubbed response!

Exercise 3 - When GET /frameworks fails an error message should be present
    When Stub Endpoint And Return Error     /frameworks         418
    And I Reload The Page
    Then There Should Be An Error Containing    ERROR: retrieving framework information failed

Exercise 4 - Validate the response of GET /frameworks against JSON schema
    When I Make A GET Request to /frameworks with the PythonLibrary
    Then The Response Should Validate Against JSON schema    frameworks-response-schema.json       ${frameworks-response}

Exercise 5 - Click on the $1.000.000 Button
    When I Click The $1.000.000 Button

Exercise 6 - Use the PythonLibrary to make a POST to /signup
    When I Make A POST Request To /signup with the PythonLibrary       Robot     Framework
    Then The Response Should Validate Against JSON schema    signup-response-schema.json       ${signup-response}

Bonus 1 - Intercept GET /frameworks with the Browser library and validate the response against JSON schema
    When I Reload The Page
    And I Intercept The Request     \/frameworks
    Then The Response Should Validate Against JSON schema    frameworks-response-schema.json       ${response}
