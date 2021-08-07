*** Settings ***
Resource   resources.resource

*** Test Cases ***
Exercise 1 - Use the BrowserLibrary to fill in the form
    Given I Visit The Robot Framework Workshop Website
    When I Input The First Name   Test
    And I Input The Last Name     User
    And I Click The Submit Button
    Then The Output Element Should Contain   Test User

Exercise 2 - Stub the GET /frameworks response
    Given I Visit The Robot Framework Workshop Website
    Take Screenshot

    Log All Browser Requests
    Stub Endpoint And Return File   /robotframework     ${CURDIR}/stub_response.json
    Reload
    Take Screenshot
    Stub Endpoint And Return Error  /frameworks         402
    Reload
    Take Screenshot

    When I Input The First Name     Test
    And I Input The Last Name       User
    And I Click The Submit Button
    Take Screenshot

    Then The Output Element Should Contain   Test User


Exercise 3 - When GET /frameworks fails an error message should be present
    ...

Exercise 4 - Validate the response of GET /frameworks against JSON schema
    ...

Exercise 5 - Check for console errors
    ...

Exercise 6 - Use the WorkshopLibrary to make a POST to /robotframewok
    ...
