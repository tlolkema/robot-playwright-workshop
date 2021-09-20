*** Settings ***
Library   Collections
Library   OperatingSystem
Library   String

Library   Browser    jsextension=exercises/PlaywrightLibrary.js
Library   ./PythonLibrary.py
Library   JSONSchemaLibrary  ./exercises/schemas


*** Variables ***
${workshop_website}   http://localhost:5000
${first_name_input}   id=firstName
${output_element}     id=output
## Define missing locators here
         

*** Keywords ***
Workshop Setup
   I Visit The Robot Framework Workshop Website
   Log All Browser Requests
   Find And Log All Console Errors

Workshop Teardown
   ${file}     Get File          playwright-log.txt
   @{lines}    Split To Lines    ${file}
   ${count}    Get Match Count   ${lines}    CONSOLE ERROR:*
   IF  ${count}
      Fail     Test has failed because ${count} error(s) were found in the browser's console.
   END

## Browser keywords
I Visit The Robot Framework Workshop Website
   New Page    ${workshop_website}

I Reload The Page
   Reload
   
I Input The First Name
   [Arguments]  ${first_name}
   Fill Text    ${first_name_input}   ${first_name}

##                   Write your own Browser keywords here


## Custom Library Keywords
The Response Should Validate Against JSON schema
   [Arguments]    ${schema_name}   ${response}
   Validate Json  ${schema_name}   ${response}

I Make A POST Request To /signup with the PythonLibrary
   [Arguments]         ${first_name}    ${last_name}
   ${signup-response}   Post Signup      ${first_name}   ${last_name}
   Set Test Variable   ${signup-response}

I Make A GET Request to /frameworks with the PythonLibrary
   ${frameworks-response}   Get Frameworks
   Set Test Variable   ${frameworks-response}
