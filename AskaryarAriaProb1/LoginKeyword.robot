*** Settings ***
Documentation Unique Test Example for Odoo 15 project using SeleniumLibrary.
Library SeleniumLibrary

*** Variables ***
${LOGIN URL} http://localhost:8069/web/login/
${BROWSER} Chrome

*** Test Cases ***
Login Test Case
    Key objective is to open Odoo 15 login page
    Sleep    5s
    enter username student@gmail.com
    Sleep    5s
    enter password student
    Sleep    5s
    Submit the login form
    Sleep    5s
    Verify successful login
    Sleep    5s
    Close Browser

*** Keywords ***
Open the Odoo login page
Open Browser ${LOGIN URL} ${BROWSER}
Title Should Be Login | My Website

Enter valid credentials
Input Text login admin
Input Text password admin

Submit the login form
Click Element //button[@type='submit']

Verify successful login
Title Should Be Odoo