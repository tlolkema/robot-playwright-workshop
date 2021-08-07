*** Settings ***
Library   Browser    jsextension=exercises/PlaywrightLibrary.js
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
