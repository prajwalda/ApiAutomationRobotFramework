*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${base_url}=    https://petstore.swagger.io

*** Test Cases ***
Put_CustomerRegistration
    Create Session    mySession    ${base_url}
    ${body}=    Create Dictionary    id=1    username=prajwal    firstName=prajwal    lastName=motghare    email=abc@gmail.com    password=12345678    phone=9172727273    userStatus=0
    ${header}=    Create Dictionary    Content-Type=application/json
    ${response}=    POST On Session    mySession    /v2/user    json=${body}    headers=${header}

    Log To Console  ${response.status_code}
    Log To Console  ${response.content}

    #VALIDATIONS
    ${res_body}=    Convert To String   ${response.content}
    Should Contain    ${res_body}   200