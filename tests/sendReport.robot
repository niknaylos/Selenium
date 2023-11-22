*** Settings ***
Documentation       Selenium automation of test scenario: login + pick chat + send message

Library             RPA.Browser.Selenium    auto_close=${True}
Library             String
Library             DateTime


*** Tasks ***
Login into Tawasal 
    Open twl web
    Input phone
    Input OTP
    Open chat
    Send message


*** Keywords ***
Open twl web
    Open Browser
    Maximize Browser Window
    Go To    https://web.tawasal.ae/

Input phone
    Input Text    css:sign-in-phone-number    9996617843
    Wait Until Element Is Visible    css:.Button.default.has-ripple.primary    30s
    Click Button    css:.Button.default.has-ripple.primary

Input OTP
    Wait Until Element Is Visible    sign-in-code    # 10s
    Input Text    sign-in-code    11111

Open chat
    Wait Until Element Is Visible    css:#tawasal-search-input    30s
    Input Text    css:#tawasal-search-input    Saved Messages
    Wait Until Element Is Visible
    ...    css:div[class='ListItem chat-item-clickable search-result no-selection'] div[role='button']
    ...    30s
    Click Element    css:div[class='ListItem chat-item-clickable search-result no-selection'] div[role='button']

Send message
    ${date}=    Get Current Date    UTC
    Input text    css:#editable-message-text    Test message ${date} UTC
    Wait Until Element Is Visible    css:button[title='Send Message']    30s
    Click Element    css:button[title='Send Message']
