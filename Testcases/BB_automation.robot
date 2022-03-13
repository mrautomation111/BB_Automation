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
    web_createBatchTemplate    TC01
    web_createBatchTemplate    TC02
    web_createBatchTemplate    TC03
    web_createBatchTemplate    TC03
    [Teardown]    Close All Browsers

<<<<<<< HEAD
TC04_AccountActivitiesAndRreporting_CreateReports
    Openbb_app
    Sleep    10s
    CreateReports
=======
TC03_SendMail
    Openbb_app
    Maximize Browser Window
    Send_Email    a
    Send_Email    b
    Send_Email    c
>>>>>>> 48fbad3d6de895396bb7334742ace6db18f33208
