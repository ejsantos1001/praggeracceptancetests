*** Settings ***
Library     Selenium2Library
Library     String
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
    a user submits a team login form
    a user lands on the team dashboard page

a user is able to open the team login page
    Open Browser   ${teamloginurl}    chrome

a user submits a team login form
    Execute Javascript   document.querySelector('${teamdomainfield_location_css}').value='&{teamleaduser}[teamname]'
    Simulate             css=${teamdomainfield_location_css}   propertychange
    let the team login spinner pass
    Execute Javascript   document.querySelector('${usernameemailfield_locatain_css}').value='&{teamleaduser}[username]'
    Execute Javascript   document.querySelector('${passwordfield_locaiton_css}').value='&{teamleaduser}[password]'
    Click Button    css=${submit_button_css}

a user lands on the team dashboard page
    ${actual}      Execute Javascript   var url = location.href;   return url;
    Should be equal   ${actual}       ${teamdashboardurl}


a user is able to submit employee data

    :FOR  ${X}  IN  @{employeelist}
        \    @{employeedatagen}   Split String   ${X}    separator=,
        \    Wait until element is visible   css=${employee_admin_page_link_locator_css}
        \    Click link   css=${employee_admin_page_link_locator_css}
        \    ${actual}      Execute Javascript   var url = location.href;   return url;
        \    Should be equal   ${actual}       ${employeeadminurl}
        \    Click link   css=${add_employee_link_locator_css}
        \    Input Text   css=${employee_code_field_locator_css}             @{employeedatagen}[0]
        \    Input Text   css=${employee_username_field_locator_css}         @{employeedatagen}[1]
        \    Input Text   css=${employee_email_field_locator_css}            @{employeedatagen}[2]
        \    Input Text   css=${employee_password_field_locator_css}         @{employeedatagen}[3]
        \    Input Text   css=${employee_firstname_field_locator_css}        @{employeedatagen}[4]
        \    Input Text   css=${employee_lastname_field_locator_css}         @{employeedatagen}[5]
        \    Click Button  css=${add_employee_btn_locator_css}




#utility keywords
let the team login spinner pass
    Wait Until Element Is Visible       css=#home_login_team_web_address_refresh
    Wait Until Element Is Not Visible   css=#home_login_team_web_address_refresh

