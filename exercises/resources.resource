*** Settings ***
Library   Browser    jsextension=exercises/PlaywrightLibrary.js
Library   Collections
Library   OperatingSystem
Library   String
Library   ./WorkshopLibrary.py

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
   Take Screenshot
   ${file}     Get File          playwright-log.txt
   @{lines}    Split To Lines    ${file}
   ${count}    Get Match Count   ${lines}    CONSOLE ERROR:*
   IF  ${count}
      Fail     Test has failed because ${count} error(s) were found in the browser's console.
   END

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

And I Click The Submit Button
   Click        ${submit_button}

Then The Output Element Should Contain
   [Arguments]   ${string}
   ${element_text} =   Get Text   ${output_element}
   Should Contain   ${element_text}      ${string}

Then There Should Be An Error Containing
   [Arguments]   ${string}
   ${element_text} =   Get Text   ${alert}
   Should Contain   ${element_text}      ${string}

I Click The $1.000.000 Button
   Click        ${money_button}
