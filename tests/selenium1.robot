*** Settings ***
Documentation       Selenium automation of test scenario: login + pick chat + send message

Library             RPA.Browser.Selenium    auto_close=${True}
Library             String
Library             DateTime

*** Variables ***
${document_url}=    https://shorturl.at/stBHP
${profile}=    /Users/admin/Library/Application Support/Firefox/Profiles/r8lre6dd.Robot Framework

#Message variables
${document_url}=    https://shorturl.at/stBHP
# ${message1}=    UTC
${report_message}=    [Report link](${document_url})
    #Selectors
${next_btn}=    css:.Button.default.has-ripple.primary    #Button 'Next' after phone input
${msg_field}=    css:#editable-message-text    #Message field selector
${chat}=    css:div[class='ListItem chat-item-clickable search-result no-selection'] div[role='button']    #Specific chat selector

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
    Wait Until Element Is Visible    ${next_btn}    30s
    Click Button    ${next_btn}

Input OTP
    Wait Until Element Is Visible    sign-in-code    
    Input Text    sign-in-code    11111

Open chat
    Wait Until Element Is Visible    css:#tawasal-search-input    5s
    Input Text    css:#tawasal-search-input    Report Hub
    Wait Until Element Is Visible    ${chat}    5s

    Click Element    ${chat}

Send message
    ${date}=    Get Current Date    UTC
    Input text    ${msg_field}    ${date} UTC
    Press Keys    ${msg_field}    SHIFT+RETURN
    Press Keys    ${msg_field}    ${report_message} 
    Wait Until Element Is Visible    css:button[title='Send Message']    5s
    Click Element    css:button[title='Send Message']
