*** Settings ***
Resource          ../Libraries/librarymanager.txt
Resource          ../Resources/ResourceManger.txt
Library           ../scripts/excellib.py

*** Test Cases ***
TC01_Accountsummaryverfication
    Openbb_app
