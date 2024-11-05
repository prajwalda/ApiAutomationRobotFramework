*** Settings ***
Library    RequestsLibrary
Library    Collections


*** Variables ***
${base_url}    https://example.com
${username}    your_username
${password}    your_password

*** Test Cases ***
Basic Auth Test
    # Create a session with Basic Auth credentials
    Create Session    mysession    ${base_url}    auth=${username}:${password}

    # Make a GET request to an endpoint requiring authentication
    ${response}=    GET On Session    mysession    /api/v1/protected_resource

    # Check that the request was successful
    Should Be Equal As Numbers    ${response.status_code}    200
    Log To Console    ${response.json()}
