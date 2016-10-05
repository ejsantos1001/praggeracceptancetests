*** Settings ***
Resource    resource.robot

*** Test Cases ***
Register
    GIVEN a user is in the register page
    WHEN a user sumbits a filled registration form
    AND after 7 seconds
    THEN a user lands on the newly registered team dashboard page
         


Restricted Registrations



Team Login
    GIVEN a user is able to open the team login page
    AND a user submits a team login form
    THEN a user is able to open the team dashboard page



Add employee
    GIVEN a user is able to team login
    THEN a user is able to submit employee data


Prag in


Prag out


settings update


Profile update


Password update
