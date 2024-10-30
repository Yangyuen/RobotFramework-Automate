*** Settings ***
Library           SeleniumLibrary


*** Variables ***
${URL}            https://www.lambdatest.com/selenium-playground/ajax-form-submit-demo
${Browser}        Chrome


*** Test Cases ***
TC-001 Form Submit Success
    [Documentation]    ทดสอบการกรอกและส่งข้อมูลในฟอร์มที่ถูกต้อง
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window

    Input Text    id=title    test1234
    Input Text    id=description    Test12345677899
    Click Button    id=btn-submit
    Close Browser

TC-002 Empty Form Submit
    [Documentation]    ทดสอบการกรอกและส่งข้อมูลในฟอร์มที่ถูกต้อง
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window

    Click Button    id=btn-submit
    Close Browser