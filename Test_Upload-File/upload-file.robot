*** Settings ***
Library            SeleniumLibrary
*** Variables ***
${URL}                https://www.lambdatest.com/selenium-playground/upload-file-demo
${BROWSER}            Chrome
${file}               xpath://*[@id='file']
${allowed_file}       C:\\Users\\Yungyuen.K\\Downloads\\1toall.pdf
${disallowed_file}    C:\\Users\\Yungyuen.K\\Downloads\\travelling.xls
*** Test Cases ***
TC-001 Verify Allowed File Upload
    [Documentation]    ทดสอบการอัปโหลดไฟล์ที่ได้รับอนุญาต (pdf, png, jpeg, jpg)
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # ตรวจสอบว่าปุ่ม Choose FIle ปรากฏ
    Wait Until Element Is Visible    ${file}
    
    # Upload Allowed File
    Choose File    ${file}    ${allowed_file}

    # ตรวจสอบผลลัพธ์ที่คาดหวัง File Successfully Uploaded
    Wait Until Element Contains   xpath=//*[@id="error"]    File Successfully Uploaded

    Close Browser
TC-002 Verify Disallowed File Upload
    [Documentation]    ทดสอบการอัปโหลดไฟล์ที่ไม่ได้รับอนุญาต (เช่น exe, xls, word)
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # ตรวจสอบว่าปุ่ม Choose FIle ปรากฏ
    Wait Until Element Is Visible    ${file}
    

    # Upload Disallowed File
    Choose File    ${file}    ${disallowed_file}

    # ตรวจสอบผลลัพธ์ที่คาดหวัง File type should be pdf, png, jpeg or jpg
    Wait Until Element Contains   xpath=//*[@id="error"]    File type should be pdf, png, jpeg or jpg

    Close Browser
