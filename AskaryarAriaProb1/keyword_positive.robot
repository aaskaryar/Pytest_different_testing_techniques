*** Settings ***
Documentation     Odoo15 Project Creation Test Example
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      http://localhost:8069/web/login/
${BROWSER}        Chrome
${USERNAME}       test@test.com
${PASSWORD}       test
${PROJECT_NAME}   New Project

*** Test Cases ***
Create Project Test Case
    Open Odoo Login Page
    Choose Database    aria
    Input Username    ${USERNAME}
    Input Password    ${PASSWORD}
    Submit Credentials
    Verify Successful Login
    Go to Projects Page
    Create New Project    ${PROJECT_NAME}
    Verify Project Creation    ${PROJECT_NAME}

*** Keywords ***
Open Odoo Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be    Login | My Website

Choose Database
    [Arguments]    ${database}
    Click Element    xpath=//a[@class='o_select_database_btn btn btn-secondary']
    Click Element    xpath=//a[contains(text(),'${database}')]

Input Username
    [Arguments]    ${username}
    Input Text    id=login    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    id=password    ${password}

Submit Credentials
    Click Button    xpath=//button[@type='submit']

Verify Successful Login
    Title Should Be    Odoo

Go to Projects Page
    Click Link    xpath=//a[@class='oe_menu_toggler']
    Click Link    xpath=//a[contains(text(),'Projects')]

Create New Project
    [Arguments]    ${project_name}
    Click Button    xpath=//button[contains(text(),'Create')]
    Input Text    xpath=//input[@name='name']    ${project_name}
    Click Button    xpath=//button[contains(text(),'Save')]

Verify Project Creation
    [Arguments]    ${expected_project_name}
    Page Should Contain    ${expected_project_name}
