*** Settings ***
Library           SeleniumLibrary
Resource          helpers.robot  
Suite Setup       Open Browser And Navigate To Login
Suite Teardown    Close Browser

*** Variables ***
${BROWSER}                        Chrome
${LOGIN_PAGE_URL}                 https://www.phptravels.net/login
${LoginEmailField}                id=email
${LoginPasswordField}             id=password
${rememberMeField}                id=rememberchb
${loginButton}                    id=submitBTN
${emptyEmailError}                Email cannot be empty.
${emptyPasswordError}             Password cannot be empty.
${invalidCredentialsError}        Invalid email or password.
${accountLockedError}             Your account has been locked.
${dashboardUrl}                   https://www.phptravels.net/dashboard
*** Keywords ***
Open Browser And Navigate To Login
    Open Browser    ${LOGIN_PAGE_URL}    ${BROWSER}
    Maximize Browser Window

Enter Credentials
    [Arguments]    ${emailValue}    ${passwordValue}
    Input Text    ${LoginEmailField}    ${emailValue}
    Input Text    ${LoginPasswordField}    ${passwordValue}

Check Mandatory Fields Errors
    helpers.Check error message    ${emptyEmailError}
    helpers.Check error message    ${emptyPasswordError}

Check "Remember Me"
    Select Checkbox    ${rememberMeField}

Check Login Error Message
    [Arguments]    ${expectedError}
    helpers.Check error message    ${expectedError}

*** Test Cases ***
UL_TC02 User Login with Invalid Credentials
    [Tags]    Login
    Enter Credentials    invalid@example.com    wrongpassword
    Click Button    ${loginButton}
    Wait Until Page Contains Element  id=rememberchb timeout=10s
    Log    Error message should be displayed indicating invalid credentials, and user should not be logged in.

UL_TC03 User Login with Locked Account
    [Tags]    Login
    Enter Credentials    abduawol@gmail.com    knpass123
    Click Button    ${loginButton}
    Wait Until Page Contains Element  id=rememberchb timeout=10s
    Log    Error message should be displayed indicating the account is locked, and user should not be logged in.
UL_TC01 User Login with Valid Credentials
    [Tags]    Login
    Enter Credentials    maajidawol@gmail.com    password123
    Click Button    ${loginButton}
    Wait Until Page Contains Element     class=author-content    timeout=10s
    Log    User should be logged in successfully and redirected to the dashboard.

