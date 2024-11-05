*** Settings ***
Library    RequestsLibrary
Library    Collections
Library     RequestsLibrary
Library     Collections

*** Variables ***
${base_url} =    https://fakestoreapi.com
${id} =    1


*** Test Cases ***
Get_weatherInfo
    Create Session    mysession    ${base_url}
    ${response}=      GET On Session    mysession    /products/${id}
#    Should Be Equal As Strings    ${response.status_code}    200
#    Log    ${response.json()}
#    Log to console    ${response.status_code}
#    Log to console    ${response.content}

    #VALIDATIONS
    ${status_code}  Convert to string    ${response.status_code}
    Should be equal    ${status_code}   200

    ${body}=    Convert to string    ${response.content}
    Should contain    ${body}   title

    ${contentTypeValue}=    Get from dictionary    ${response.headers}  Content-type
    Should be equal    ${contentTypeValue}  application/json