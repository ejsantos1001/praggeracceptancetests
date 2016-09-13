*** Settings ***
Resource    resource.robot

*** Test Cases ***
Register
    GIVEN a user is in the register page

Team Login
    GIVEN a user is able to open the team login page
    AND a user submits a team login form
    THEN a user is able to open the team dashboard page

Add employee

    GIVEN a user is able to team login
    AND a user is able to go to the employee admin page


