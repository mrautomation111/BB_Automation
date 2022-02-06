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

TC02_AddMainBatchTemplate
    Openbb_app
    Maximize Browser Window
    web_Mouseover    landingpage    payments_transfers
    web_clickelement    payments_transfers    maintain_batch_template
    web_clickelement    maintain_batch_template    add_new
    web_inputtext    maintain_batch_template    template_name    OlaTemp
    web_inputtext    maintain_batch_template    template_desc    this is a description
    web_clickelement    maintain_batch_template    ACH_batch_class
    web_clickelement    maintain_batch_template    ACH_batch_class_option
    web_clickelement    maintain_batch_template    ACH_ID
    web_clickelement    maintain_batch_template    ACH_ID_option
    Unselect Checkbox    //input[@name='offsetTrans']
    Checkbox Should Not Be Selected    //input[@name='offsetTrans']
    web_clickelement    maintain_batch_template    add_button
