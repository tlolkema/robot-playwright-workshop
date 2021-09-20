*** Settings ***
Resource         resources.resource
Test Setup       Workshop Setup


*** Test Cases ***
Exercise 1 - Use the BrowserLibrary to fill in the form
    When I Input The First Name     Test
    ## Use your own keywords here
    Then The Output Element Should Contain   ## Put your validation here

Exercise 2 - Stub the POST /signup response
    When Stub Endpoint And Return File      ## Put the required arguments here
    ## Use your own keywords here
    Then The Output Element Should Contain      ## Put your validation here

Exercise 3 - When GET /frameworks fails an error message should be present
    ## Use the stub keyword here to force an error on /frameworks
    And I Reload The Page
    Then There Should Be An Error Containing    ## Put your validation here

Exercise 4 - Validate the response of GET /frameworks against JSON schema
    ## Use the predefined keywords here to make a request and validate it agains a JSON schema
    ## You should generate this schema yourself and put it in the 'schemas' folder

Exercise 5 - Click on the $1.000.000 Button
    ## Use your own keywords here

Exercise 6 - Use the PythonLibrary to make a POST to /signup
    ## Use the predefined keywords here to make a request and validate it agains a JSON schema

## Exercise 7 - Check if any console errors occured during this suite, let the suite fail if errors occured
