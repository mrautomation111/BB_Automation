*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
TC01
    Open Browser    url    browser=firefox    alias=None    remote_url=False    desired_capabilities=None    ff_profile_dir=None

TC02
    openexcel    filename    sheetname

Tc03
    Open Context Menu

Tc04
    Open Browser    https://www.google.com    opera
