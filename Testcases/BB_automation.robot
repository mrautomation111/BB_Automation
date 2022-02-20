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
    web_createBatchTemplate    a
    web_createBatchTemplate    b
    web_createBatchTemplate    c
    web_createBatchTemplate    d
    [Teardown]    Close All Browsers

TC03_SendMail
    Openbb_app
    web_clickelement    landingpage    EmailLink
    web_clickelement    Emailpage    Preferred_Method_of_Contact
    web_inputtext    Emailpage    Subject    "Email1"
    web_inputtext    Emailpage    Message    Email1
    web_clickelement    Emailpage    Submit
