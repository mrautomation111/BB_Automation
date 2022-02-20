*** Settings ***
Resource          ../Libraries/librarymanager.txt
Resource          ../Resources/ResourceManger.txt
Library           ../scripts/excellib.py
Library           ExcelLibrary
Library           DateTime

*** Test Cases ***
TC01_Accountsummaryverfication
    Openbb_app

Create_Reports
    Openbb_app
    Sleep    10s
    CreateReports
