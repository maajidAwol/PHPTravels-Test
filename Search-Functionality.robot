*** Settings ***
Library           SeleniumLibrary
Resource          helpers.robot 
Suite Setup       Open Browser
Suite Teardown    Close Browser
*** Variables ***
${BROWSER}                        Chrome
${HOTEL_SEARCH_PAGE_URL}          https://www.phptravels.net/hotels
${FLIGHT_SEARCH_PAGE_URL}         https://www.phptravels.net/flights
${TOURS_SEARCH_PAGE_URL}          https://www.phptravels.net/tours
${LocationField}                  id=location
${DateField}                      id=checkin
${SearchButton}                   id=searchBTN
${NoResultsMessage}               No results found
${InvalidCriteriaMessage}         Invalid search criteria

*** Keywords ***
Open Browser And Navigate To Page
    [Arguments]    ${pageURL}
    Open Browser    ${pageURL}    ${BROWSER}
    Maximize Browser Window

Enter Search Criteria
    [Arguments]   ${location}    ${dates}
    Input Text    ${LocationField}    ${location}
    Input Text    ${DateField}    ${dates}

Click Search
    Click Button    ${SearchButton}

Check No Results Message
    Page Should Contain    ${NoResultsMessage}

Check Invalid Criteria Message
    Page Should Contain    ${InvalidCriteriaMessage}

*** Test Cases ***
# Search for Hotels
SH_TC01 Search Hotels with Valid Criteria
    [Tags]    Search    Hotels
    Open Browser And Navigate To Page    ${HOTEL_SEARCH_PAGE_URL}
    Enter Search Criteria    New York    2024-07-01 to 2024-07-10
    Click Search
    Log    Relevant hotel listings should be displayed based on the entered criteria.

SH_TC02 Search Hotels with No Results
    [Tags]    Search    Hotels
    Open Browser And Navigate To Page    ${HOTEL_SEARCH_PAGE_URL}
    Enter Search Criteria    NoSuchPlace    2024-07-01 to 2024-07-10
    Click Search
    Check No Results Message
    Log    No hotel listings should be displayed, and an appropriate message indicating no results should be shown.

SH_TC03 Search Hotels with Invalid Criteria
    [Tags]    Search    Hotels
    Open Browser And Navigate To Page    ${HOTEL_SEARCH_PAGE_URL}
    Enter Search Criteria    New York    2023-01-01 to 2023-01-10
    Click Search
    Check Invalid Criteria Message
    Log    Error message or no results should be displayed, indicating invalid search criteria.

# Search for Flights
SF_TC01 Search Flights with Valid Criteria
    [Tags]    Search    Flights
    Open Browser And Navigate To Page    ${FLIGHT_SEARCH_PAGE_URL}
    Enter Search Criteria    New York to Los Angeles    2024-07-01 to 2024-07-10
    Click Search
    Log    Relevant flight options should be displayed based on the entered criteria.

SF_TC02 Search Flights with No Results
    [Tags]    Search    Flights
    Open Browser And Navigate To Page    ${FLIGHT_SEARCH_PAGE_URL}
    Enter Search Criteria    NoSuchRoute    2024-07-01 to 2024-07-10
    Click Search
    Check No Results Message
    Log    No flight options should be displayed, and an appropriate message indicating no results should be shown.

SF_TC03 Search Flights with Invalid Criteria
    [Tags]    Search    Flights
    Open Browser And Navigate To Page    ${FLIGHT_SEARCH_PAGE_URL}
    Enter Search Criteria    New York to Los Angeles    2023-01-01 to 2023-01-10
    Click Search
    Check Invalid Criteria Message
    Log    Error message or no results should be displayed, indicating invalid search criteria.

# Search for Tours
ST_TC01 Search Tours with Valid Criteria
    [Tags]    Search    Tours
    Open Browser And Navigate To Page    ${TOURS_SEARCH_PAGE_URL}
    Enter Search Criteria    New York    2024-07-01 to 2024-07-10
    Click Search
    Log    Relevant tour options should be displayed based on the entered criteria.

ST_TC02 Search Tours with No Results
    [Tags]    Search    Tours
    Open Browser And Navigate To Page    ${TOURS_SEARCH_PAGE_URL}
    Enter Search Criteria    NoSuchPlace    2024-07-01 to 2024-07-10
    Click Search
    Check No Results Message
    Log    No tour options should be displayed, and an appropriate message indicating no results should be shown.

ST_TC03 Search Tours with Invalid Criteria
    [Tags]    Search    Tours
    Open Browser And Navigate To Page    ${TOURS_SEARCH_PAGE_URL}
    Enter Search Criteria    New York    2023-01-01 to 2023-01-10
    Click Search
    Check Invalid Criteria Message
    Log    Error message or no results should be displayed, indicating invalid search criteria.
