*** Settings ***
Library            SeleniumLibrary

*** Variables ***
${URL}             https://www.lambdatest.com/selenium-playground/radiobutton-demo
${BROWSER}         Chrome
${FEMALE}          xpath://*[@id="__next"]/div/section[2]/div/div/div/div[1]/div/label[2]/input
${MALE}            xpath://*[@id="__next"]/div/section[2]/div/div/div/div[1]/div/label[1]/input
${Result}          xpath://*[@id="__next"]/div/section[2]/div/div/div/div[1]/div/p[2]


*** Test Cases ***
TC-001 Click on Radio Button 'Female'
    [Documentation]    ทดสอบการ Click Radio Button Female
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    ${FEMALE}
    Click Button    id=buttoncheck
    
    # ตรวจสอบว่า Radio Button ที่เลือกคือ Female
    Element Attribute Value Should Be    ${FEMALE}    checked    true
    
    # ตรวจสอบผลลัพธ์ที่คาดหวัง 'Radio button 'Female' is checked'
    ${element_text}=    Get Text    ${Result}
    Should Contain    ${element_text}    Radio button 'Female' is checked

    Sleep    1
    Close Browser
TC-002 Click on Radio Button 'Male'
    [Documentation]    ทดสอบการ Click Radio Button Male
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    ${MALE}
    Click Button    id=buttoncheck

    # ตรวจสอบ Radio Button ที่เลือกคือ Male
    Element Attribute Value Should Be    ${MALE}    checked    true
    
    # ตรวจสอบผลลัพธ์ที่คาดหวัง 'Radio button 'Male' is checked'
    ${element_text}=    Get Text    ${Result}
    Should Contain    ${element_text}    Radio button 'Male' is checked
    
    Sleep    1
    Close Browser

TC-003 Empty Radio Button
    [Documentation]    Empty Radio Button
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Button    id=buttoncheck
    
    # ตรวจสอบผลลัพธ์ที่คาดหวัง 'Radio button is Not checked'
    ${element_text}=    Get Text    ${Result}
    Should Contain    ${element_text}    Radio button is Not checked

    Sleep    1
    Close Browser