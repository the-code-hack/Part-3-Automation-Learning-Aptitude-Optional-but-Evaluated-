*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser

*** Variables ***
${URL}            https://uat.hummings.in/
${BROWSER}        chrome
${VALID_EMAIL}    testuser@gmail.com
${VALID_PASSWORD}    Test@123
${INVALID_EMAIL}  wronguser@gmail.com
${INVALID_PASSWORD}  wrongpass

*** Test Cases ***
Valid Login Flow
    [Documentation]    Verify user can successfully log in with valid credentials.
    Input Text    id=email    ${VALID_EMAIL}
    Input Text    id=password    ${VALID_PASSWORD}
    Click Button    xpath=//button[contains(.,'Login')]
    Wait Until Page Contains Element    xpath=//h1[contains(.,'Dashboard')]    10s
    Page Should Contain Element         xpath=//h1[contains(.,'Dashboard')]

Invalid Login Flow
    [Documentation]    Verify login shows error with invalid credentials.
    Input Text    id=email    ${INVALID_EMAIL}
    Input Text    id=password    ${INVALID_PASSWORD}
    Click Button    xpath=//button[contains(.,'Login')]
    Wait Until Page Contains    Invalid Credentials    10s
    Page Should Contain    Invalid Credentials


*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    xpath=//button[contains(.,'Login')]    10s
