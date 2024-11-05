*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}     http://jsonplaceholder.typicode.com

*** Test Cases ***
TestHeaders
    Create Session    mysession     ${base_url}
    ${response}=    GET On Session    mysession     /photos
    Log to console    ${response.headers}

#    Log to console    ${response.headers['Content-Encoding']}

    ${contentTypeValue}=    Get from dictionary    ${response.headers}  Content-Type
    Should be equal    ${contentTypeValue}      application/json; charset=utf-8

TestCookies
    Create Session    mysession     ${base_url}
    ${response}=    GET On Session    mysession     /photos
    Log to console    ${response.cookies}