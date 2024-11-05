*** Settings ***
Library    JSONLibrary
Library    os
Library    Collections
Library    RequestsLibrary

*** Variables ***
${base_url}    https://restcountries.com

*** Test Cases ***
Get_countryInfo
    Create Session    mysession     ${base_url}
    ${response}=    GET On Session    mysession     /v2/alpha/IN
    ${json_obj}=    To Json    ${response.content}

    #Single data validation
    ${country_name}    Get value from json    ${json_obj}  $.name
    Log to console    ${country_name[0]}
    Should be equal    ${country_name[0]}   India


    #Single data validation in Array
    ${borders}=  Get value from json    ${json_obj}  $.borders[0]
    Log to console    ${borders[0]}
    Should be equal    ${borders[0]}    AFG

    #Multiple data validation in array
    ${borders}=  Get value from json    ${json_obj}  $.borders
    Log to console    ${borders[0]}
    Should contain any    ${borders[0]}    AFG      BGD     BTN     MMR     CHN
    Should not contain any    ${borders[0]}    abc xyz

