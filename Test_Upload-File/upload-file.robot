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

    Wait Until Element Contains   xpath=//*[@id="error"]    File Successfully Uploaded

    Close Browser