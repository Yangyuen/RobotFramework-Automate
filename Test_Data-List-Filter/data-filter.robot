*** Settings ***
Library            SeleniumLibrary

*** Variables ***
${URL}             https://www.lambdatest.com/selenium-playground/data-list-filter-demo
${BROWSER}         Chrome

*** Test Cases ***
TC-001 Verify Filter with Keyword "Founder"
    [Documentation]    ตรวจสอบการกรองข้อมูลเมื่อใช้คำว่า "Founder"
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=input-search    Founder
    Sleep    10
    ${founder_results}=    Get WebElements    xpath=//*[contains(text(),'Founder')]
    Length Should Be    ${founder_results}    1
    ${element_text}=    Get Text    xpath=//*[@id="__next"]/section[3]/div/div/div/div/div
    Should Contain    ${element_text}    Jonathan Oakes
    Close Browser
