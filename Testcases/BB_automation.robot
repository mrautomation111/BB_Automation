*** Settings ***
Suite Setup
Suite Teardown
Resource          ../Libraries/librarymanager.txt
Resource          ../Resources/ResourceManger.txt
Library           ../scripts/excellib.py

*** Test Cases ***
TC01_Accountsummaryverfication
    [Setup]
    Openbb_app
    Maximize Browser Window
    web_Mouseover    landingpage    Administration
    web_clickelement    landingpage    add_edit_user
    Handle Alert    ACCEPT
    web_inputtext    add_edit_user    Username    karthikeyan
    [Teardown]    Close All Browsers

TC02_AddMainBatchTemplate_use_lower_case_letters
    web_createBatchTemplate    TC01
    web_createBatchTemplate    TC02
    web_createBatchTemplate    TC03
    web_createBatchTemplate    TC03
    [Teardown]    Close All Browsers

TC03_SendMail
    Openbb_app
    Maximize Browser Window
    Send_Email    a
    Send_Email    b
    Send_Email    c
