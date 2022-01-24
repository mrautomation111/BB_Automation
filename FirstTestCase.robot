*** Settings ***
Library           SeleniumLibrary
Library           ExcelLibrary
Library           Collections

*** Variables ***
${URL}            https://opensource-demo.orangehrmlive.com/
${SPICEURL}       https://www.spicejet.com/
${round}          //*[@data-testid='round-trip-radio-button']

*** Test Cases ***
First
    Open Browser    https://opensource-demo.orangehrmlive.com/    gc
    Maximize Browser Window
    Input Text    //input[@id='txtUsername']    Admin
    Input Text    //input[@id='txtPassword']    admin123
    Click Element    //input[@id='btnLogin']
    Click Element    //a[@id='menu_admin_viewAdminModule']
    Select From List By Label    //select[@id='searchSystemUser_userType']    Admin
    Click Element    //input[@id='searchBtn']
    @{namelist}    Create List    Admin    Automation    Aravind    dilshad
    Comment    FOR    ${Data}    IN    @{namelist}
    Comment    \    Run Keyword If    "${Data}"=="Aravind"    searchuser    ${Data}
    Comment    \    Comment    Exit For Loop If    "${Data}"=="Aravind"
    Comment    END

Second
    login
    Click Element    //a[@id='menu_admin_viewAdminModule']
    @{namelist}    Create List    Admin    Automation    Aravind    dilshad
    SearchUser1    Aravind    @{namelist}

SpiceJet
    [Documentation]    step1 : Login to spicejet application(https://www.spicejet.com/)
    ...    step2 : \ Select roundtrip
    ...    step3 : \ select FROM as "BLR" and TO as "MAA"
    ...    step4 : select the departure date as Jan30 \ and return date and feb 3
    ...    step5 : select no of adults : 2 and no of children : 1
    ...    step6 : select the currency as INR
    ...    step7 : \ click on search flight
    loginSpice    ${SPICEURL}
    Click Element    ${round}
    Input Text    //*[@data-testid="to-testID-origin"]    "BLR"
    ExcelLibrary.Open Excel Document    Book1.xlsx    testData
    @{firstname}    ExcelLibrary.Read Excel Column    0
    @{lastname}    ExcelLibrary.Read Excel Column    1

SearchJobs
    login
    Click Element    //a[@id='menu_admin_viewAdminModule']
    Click Element    //a[@id='menu_admin_Job']
    Click Element    //a[@id='menu_admin_viewJobTitleList']
    ExcelLibrary.Open Excel Document    Book1.xlsx    testData
    @{firstname}    ExcelLibrary.Read Excel Column    0
    FOR    ${i}    IN    @{firstname}
        Click Element    //a[text()='${i}']/ancestor::tr//input
    END
    @{namelist}    Create List    Admin    Automation    Aravind    dilshad

OnlyAdmin
    login
    Click Element    //a[@id='menu_admin_viewAdminModule']
    Wait Until Element Is Visible    //table[@id='resultTable']//tbody//tr
    ${rowcount}    Get Element Count    //table[@id='resultTable']//tbody//tr
     ${name_list}    Create List
    FOR    ${i}    IN RANGE    1    ${rowcount}
         ${namedetails}     Get Text     (//table[@id='resultTable']//tbody//tr/td[2]/a)[${i}]
        ${roledetails}    Get Text    (//table[@id='resultTable']//tbody//tr/td[3])[${i}]
        Run Keyword If    "${roledetails}"=="Admin"    Append To List    ${name_list}    ${namedetails}
    END
    Create Excel Document    NameData.xlsx
    Write Excel Column    1    ${name_list}
    Save Excel Document    NameData.xlsx
    Close Browser

*** Keywords ***
searchuser
    [Arguments]    ${Data}
    Input Text    //input[@id='searchSystemUser_userName']    ${Data}
    Click Element    //input[@id='searchBtn']

SearchUser1
    [Arguments]    ${FilterCondition}    @{Data}
    FOR    ${eachValue}    IN    @{Data}
        Run Keyword If    "${eachValue}"=="${FilterCondition}"    Input Text    //input[@id='searchSystemUser_userName']    ${eachValue}
        Run Keyword If    "${eachValue}"=="${FilterCondition}"    Click Element    //input[@id='searchBtn']
        Return From Keyword If    "${eachValue}"=="${FilterCondition}"
    END

login
    Open Browser    ${URL}    gc
    Maximize Browser Window
    Input Text    //input[@id='txtUsername']    Admin
    Input Text    //input[@id='txtPassword']    admin123
    Click Element    //input[@id='btnLogin']

loginSpice
    [Arguments]    ${SPICEURL}
    Open Browser    ${SPICEURL}    gc
    Maximize Browser Window
