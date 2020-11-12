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

Add Jacket To Cart
    Click Element                       xpath: //*[contains(text(), "Sauce Labs Fleece Jacket")]
    Page Should Contain                 Sauce Labs Fleece Jacket
    Click Element                       xpath: //*[contains(text(), "ADD TO CART")]
    Click Element                       class:shopping_cart_link

Checkout
    Click Element                       xpath: //*[contains(text(), "CHECKOUT")]
    Wait Until Page Contains            Checkout: Your Information
    Input Text                          id:first-name   Etunimi
    Input Text                          id:last-name    Sukunimi
    Input Text                          id:postal-code  33870
    Click Element                       class:cart_button
    Wait Until Page Contains            Checkout: Overview
    Page Should Contain                 Sauce Labs Fleece Jacket
    Click Element                       xpath: //*[contains(text(), "FINISH")]
    Wait Until Page Contains            Finish
    Page Should Contain                 THANK YOU FOR YOUR ORDER
    [Teardown]  Close Browser


*** Keywords ***
Open Browser To Login Page
    Open Browser        ${URL}  ${BROWSER}
    Title Should Be     Swag Labs