*** Settings ***
Resource   resources.resource
Test Setup       Run Keywords        Given I Visit The Robot Framework Workshop Website         Log All Browser Requests
Test Teardown    Run Keywords        Log All Browser Requests       Take Screenshot        


*** Test Cases ***
Exercise 1 - Use the BrowserLibrary to fill in the form
    When I Input The First Name   Test
    And I Input The Last Name     User
    And I Click The Submit Button
    Then The Output Element Should Contain   Test User

Exercise 2 - Stub the POST /robotframework response
    When Stub Endpoint And Return File   /robotframework     ${CURDIR}/stub_response.json
    And I Input The First Name     Test
    And I Input The Last Name       User
    And I Click The Submit Button
    Then The Output Element Should Contain   I'm a stubbed response!

Exercise 3 - When GET /frameworks fails an error message should be present
    When Stub Endpoint And Return Error  /frameworks         402
    And I Reload The Page
    Then There Should Be An Error Containing   ERROR: retrieving framework information failed

# Exercise 4 - Validate the response of GET /frameworks against JSON schema
#     ...

Exercise 5 - Check for console errors
    When I Click The $1.000.000 Button

# Exercise 6 - Use the WorkshopLibrary to make a POST to /robotframewok
#     ...
