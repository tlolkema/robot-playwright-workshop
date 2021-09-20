*** Settings ***
Library   Collections
Library   OperatingSystem
Library   String

Library   Browser    jsextension=solutions/PlaywrightLibrary.js
Library   ./PythonLibrary.py
Library   JSONSchemaLibrary  ./solutions/schemas


*** Variables ***
${workshop_website}   http://localhost:5000
${first_name_input}   id=firstName
${last_name_input}    id=lastName
${submit_button}      id=submitButton
${output_element}     id=output
${alert}              id=frameworkError
${money_button}       id=moneyButton            

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

I Input The Last Name
   [Arguments]  ${last_name}
   Fill Text    ${last_name_input}   ${last_name}

I Click The Submit Button
   Click        ${submit_button}

I Click The $1.000.000 Button
   Click        ${money_button}

The Output Element Should Contain
   [Arguments]   ${string}
   ${element_text} =   Get Text   ${output_element}
   Should Contain   ${element_text}      ${string}

There Should Be An Error Containing
   [Arguments]   ${string}
   ${element_text} =   Get Text   ${alert}
   Should Contain   ${element_text}      ${string}


## Custom Library Keywords
The Response Should Validate Against JSON schema
   [Arguments]    ${schema_name}   ${response}
   Validate Json  ${schema_name}   ${response}

I Make A POST Request To /signup with the PythonLibrary
   [Arguments]         ${first_name}    ${last_name}
   ${signup-response} =       Post Signup      ${first_name}   ${last_name}
   Set Test Variable   ${signup-response}

I Make A GET Request to /frameworks with the PythonLibrary
   ${frameworks-response} =       Get Frameworks
   Set Test Variable   ${frameworks-response}