*** Settings ***
Suite Setup
Suite Teardown
Resource          ../Libraries/librarymanager.txt
Resource          ../Resources/ResourceManger.txt
Library           ../scripts/excellib.py
Library           ExcelLibrary
Library           DateTime
Library           OperatingSystem

*** Test Cases ***
TC01_Accountsummaryverfication
    [Setup]
    Openbb_app
    Maximize Browser Window
    web_Mouseover    landingpage    Administration
    web_clickelement    landingpage    add_edit_user
    Handle Alert    ACCEPT
    web_inputtext    add_edit_user    Username    karthikeyan

TC02_AddMainBatchTemplate_use_lower_case_letters
    web_createBatchTemplate    a
    web_createBatchTemplate    b
    web_createBatchTemplate    c
    web_createBatchTemplate    d
    [Teardown]    Close All Browsers

TC04_AccountActivitiesAndRreporting_CreateReports
    Openbb_app
    Sleep    10s
    CreateReports
