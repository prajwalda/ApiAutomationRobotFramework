*** Settings ***
Library    JSONLibrary
Library    os
Library    Collections

*** Test Cases ***
Testcase1:
    ${json_obj}=    Load json from file    /home/prajwal/books.json
    ${title_value}=  Get value from json    ${json_obj['books'][0]}  $.title
    Should Be Equal    ${title_value[0]}    The Great Gatsby
#    Log to console    ${json_obj['books'][0]['title']}


    ${genre_value}=     Get value from json    ${json_obj['books'][3]}  $.genre
    Should be equal    ${genre_value[0]}   Romance

