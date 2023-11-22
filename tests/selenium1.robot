*** Settings ***
Documentation       Selenium automation of test scenario: login + pick chat + send message

Library             RPA.Browser.Selenium    auto_close=${False}
Library             String
Library             DateTime

*** Variables ***
${document_url}=    https://shorturl.at/stBHP
${profile}=    /Users/admin/Library/Application Support/Firefox/Profiles/r8lre6dd.Robot Framework
${message1}=    UTC
${report_message}=    [Report link](${document_url})

*** Tasks ***
Login into Tawasal 
    Open Firefox Without Pop-Ups
    Input phone
    Input OTP
    Open chat
    Send message


*** Keywords ***
Open Firefox Without Pop-Ups
    Open Browser    web.tawasal.ae    ff    ff_profile_dir=${profile}
Input phone
    Input Text    css:#sign-in-phone-number   9996617844
    Wait Until Element Is Visible    css:.Button.default.has-ripple.primary    30s
    Click Button    css:.Button.default.has-ripple.primary

Input OTP
    Wait Until Element Is Visible    sign-in-code    
    Input Text    sign-in-code    11111

Open chat
    Wait Until Element Is Visible    css:#tawasal-search-input    5s
    Input Text    css:#tawasal-search-input    Report Hub
    Wait Until Element Is Visible    css:div[class='ListItem chat-item-clickable search-result no-selection'] div[role='button']    5s

    Click Element    css:div[class='ListItem chat-item-clickable search-result no-selection'] div[role='button']

Send message
    ${date}=    Get Current Date    UTC
    Input text    css:#editable-message-text    ${date} ${message1}
    Press Keys    css:#editable-message-text    SHIFT+RETURN
    Press Keys    css:#editable-message-text    ${report_message} 
    Wait Until Element Is Visible    css:button[title='Send Message']    5s
    Click Element    css:button[title='Send Message']
