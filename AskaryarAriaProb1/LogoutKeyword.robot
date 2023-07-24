*** Settings ***
Documentation Unique Test Example for Odoo 15 project using SeleniumLibrary.
Library SeleniumLibrary

*** Variables ***
${LOGIN URL} http://localhost:8069/web/login/
${BROWSER} Chrome

*** Test Cases ***
Logout Test Case
    Key objective is to Logout of the current user
    Sleep    3s
    click on profile
    Sleep    3s
    click logout
    Sleep    3s
    Submit the logout form
    Sleep    3s
    Verify successful logout
    Sleep    3s
    Close Browser

*** Keywords ***
Open the Odoo profile page
Open Browser ${LOGOUT URL} ${BROWSER}
Title Should Be Profile | My Website

click logout

Submit the logout form
Click Element //button[@type='submit']

Verify successful logout
Title Should Be Odoo Login Page