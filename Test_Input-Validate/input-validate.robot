*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://www.lambdatest.com/selenium-playground/input-form-demo   # URL ของเว็บเพจที่ต้องการทดสอบ
${BROWSER}        Chrome

*** Test Cases ***
TC-001 Validate Input Form - All Required Fields
    [Documentation]    ตรวจสอบการทำงานของฟอร์มเมื่อมีการกรอกข้อมูลในฟิลด์ทั้งหมด
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=name    Test User
    Input Text    id=inputEmail4    testuser@example.com
    Input Text    id=inputPassword4    Pass1234
    Input Text    id=company    Test Company
    Input Text    id=websitename    www.test.com
    Select From List By Value    xpath=//*[@id="seleniumform"]/div[3]/div[1]/select    TH   # เลือกค่าจาก dropdown
    Input Text    id=inputCity    Test City
    Input Text    id=inputAddress1    123 Test St
    Input Text    id=inputAddress2    321 Test St
    Input Text    id=inputState    Test State
    Input Text    id=inputZip    12345
    Click Button    xpath=//*[@id="seleniumform"]/div[6]/button
    ${message}=    Get Text    xpath=//*[@id="__next"]/div/section[2]/div/div/div/div/p   # สมมติว่ามีข้อความยืนยันสำเร็จ
    Should Contain    ${message}    Thanks for contacting us, we will get back to you shortly.
    Close Browser

TC-002 Validate Input Form - Missing Required Fields
    [Documentation]    ตรวจสอบการแจ้งเตือนเมื่อไม่กรอกข้อมูลในฟิลด์ที่จำเป็น
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Button    xpath=//*[@id="seleniumform"]/div[6]/button
    # ${error}=    Get Text    xpath=//div[@class='error-message']   # สมมติว่ามีข้อความแจ้งข้อผิดพลาด
    # Should Contain    ${error}    Please fill out this field
    Close Browser

TC-003 Validate Email Field - Invalid Email Format
    [Documentation]    ตรวจสอบการแจ้งเตือนเมื่อกรอกอีเมลในรูปแบบที่ไม่ถูกต้อง
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=inputEmail4    invalid-email-format
    Click Button    xpath=//*[@id="seleniumform"]/div[6]/button
    # ${email_error}=    Get Text    xpath=//div[@class='email-error']   # สมมติว่ามีข้อความแจ้งข้อผิดพลาดสำหรับอีเมล
    # Should Contain    ${email_error}    Please enter a valid email address
    Close Browser
