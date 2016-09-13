*** Settings ***
Library     Selenium2Library
Variables   locators.py
Variables   data.py

*** Variables ***


*** Keywords ***
a user is in the register page
    Open Browser      ${registerurl}                    chrome

a user sumbits a filled registration form
    Execute Javascript   document.querySelector('${teamdomainfield_location_css}').value='&{teamleaduser}[teamdomain]'
    Input Text        css=#register_username            testusername
    Input Text        css=#register_email               testemail@gmail.com
    Input Password    css=#register_password            testpass
    Input Text        css=#register_first_name          testfirst
    Input Text        css=#register_last_name           testlast

a user is able to team login
    a user is able to open the team login page
    a user navigates to the team login page
    a user is able to open the team dashboard page

a user is able to open the team login page
    Open Browser   ${teamloginurl}    chrome

a user submits a team login form
    Execute Javascript   document.querySelector('${teamdomainfield_location_css}').value='&{teamleaduser}[teamdomain]'
    Simulate             css=${teamdomainfield_location_css}   propertychange
    let the team login spinner pass
    Execute Javascript   document.querySelector('${usernameemailfield_locatain_css}').value='&{teamleaduser}[username]'
    Execute Javascript   document.querySelector('${passwordfield_locaiton_css}').value='&{teamleaduser}[password]'
    Click Button    css=${submit_button_css}

a user is able to open the team dashboard page
    check current url  ${teamdashboardurl_actual} is equal to ${teamdashboardurl}


a user is able to go to the employee admin page
    check current url


#utility keywords
let the team login spinner pass
    Wait Until Element Is Visible       css=#home_login_team_web_address_refresh
    Wait Until Element Is Not Visible   css=#home_login_team_web_address_refresh

check current url "${actual}" is equal to "${expected}"
    ${actual}      Execute Javascript   var url = location.href;   return url;
    Should be equal   ${actual}       ${expected}