*** Settings ***
Library           SeleniumLibrary

Suite Setup       Open Browser And Navigate To Login
Suite Teardown    Close Web Browser

*** Variables ***
${BROWSER}                        Chrome
${LOGIN_PAGE_URL}                 http://example.com/login
${userEmailField}                 name=user_email
${passwordField}                  name=password
${phoneField}                     name=phone
${rememberMeField}                id=rememberMe
${emptyEmailError}                Email cannot be empty.
${emptyPasswordError}             Password cannot be empty.

*** Keywords ***
Open Browser And Navigate To Login
    Open Browser    ${LOGIN_PAGE_URL}    ${BROWSER}
    Maximize Browser Window

Enter Credentials And Pause For CAPTCHA
    [Arguments]    ${emailValue}    ${passwordValue}    ${phoneValue}
    Make Input Visible When Filled    ${userEmailField}    ${emailValue}
    Make Input Visible When Filled    ${passwordField}    ${passwordValue}
    Make Input Visible When Filled    ${phoneField}    ${phoneValue}
    Log    Please solve the CAPTCHA now.
    Wait For User To Press Key    # Pauses execution for manual CAPTCHA solving

Make Input Visible When Filled
    [Arguments]  ${fieldLocator}  ${fieldValue}
    Clear Element Text  ${fieldLocator}
    Input Text  ${fieldLocator}  ${fieldValue}
    Execute JavaScript  document.querySelector('${fieldLocator}').style.visibility = 'visible'

Capture Screenshot
    [Arguments]  ${folderName}
    Run Keyword If Test Failed  Capture Page Screenshot  ../Results/Screenshots/${folderName}/${TEST NAME}-Failed.png

Close Web Browser
    Close Browser

*** Test Cases ***
User Login With CAPTCHA
    [Tags]    Login
    Enter Credentials And Pause For CAPTCHA    user@example.com    password123    555-1234
    # Add steps here to click the login button after CAPTCHA is solved
    # Assuming you have a way to verify login success or failure