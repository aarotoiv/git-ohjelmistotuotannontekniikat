*** Settings ****
Documentation   Kirjaudutaan, tilataan takki
Library         SeleniumLibrary

*** Variables ***
${URL}          https://www.saucedemo.com
${BROWSER}      Chrome

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Input Text                          id:user-name   standard_user 
    Input Text                          id:password    secret_sauce 
    Click Element                       id:login-button
    Wait Until Page Contains            Products

*** Keywords ***
Open Browser To Login Page
    Open Browser        ${URL}  ${BROWSER}
    Title Should Be     Swag Labs