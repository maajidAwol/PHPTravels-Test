*** Settings ***
Library           SeleniumLibrary
Resource          helpers.robot  

Suite Setup       Open Browser
Suite Teardown    Close Browser

*** Variables ***
${BROWSER}                        Chrome
${HOTEL_LISTINGS_URL}             https://www.phptravels.net/hotels
${FLIGHT_LISTINGS_URL}            https://www.phptravels.net/flights
${TOUR_LISTINGS_URL}              https://www.phptravels.net/tours
${BookingHistoryURL}              https://www.phptravels.net/bookinghistory
${BookingDetailsField}            id=bookingDetails
${PaymentButton}                  id=paymentBTN
${InvalidDataError}               Invalid booking details
${ConfirmationMessage}            Booking confirmed
${CancellationMessage}            Booking cancelled

*** Keywords ***
Open Browser And Navigate To Page
    [Arguments]    ${pageURL}
    Open Browser    ${pageURL}    ${BROWSER}
    Maximize Browser Window

Select Hotel
    Click Element    xpath=//div[@class='hotel'][1]//button[text()='Book']

Select Flight
    Click Element    xpath=//div[@class='flight'][1]//button[text()='Book']

Select Tour
    Click Element    xpath=//div[@class='tour'][1]//button[text()='Book']

Enter Booking Details
    [Arguments]    ${details}
    Input Text    ${BookingDetailsField}    ${details}

Complete Payment
    Click Button    ${PaymentButton}

Check Error Message
    Page Should Contain    ${InvalidDataError}

Check Confirmation Message
    Page Should Contain    ${ConfirmationMessage}

Navigate To Booking History
    Open Browser And Navigate To Page    ${BookingHistoryURL}

Select Booking To Modify
    Click Element    xpath=//div[@class='booking'][1]//button[text()='Modify']

Select Booking To Cancel
    Click Element    xpath=//div[@class='booking'][1]//button[text()='Cancel']

Check Cancellation Message
    Page Should Contain    ${CancellationMessage}

Select Booking To Rebook
    Click Element    xpath=//div[@class='booking'][1]//button[text()='Rebook']

*** Test Cases ***
# Booking a Hotel
BH_TC01 Booking a Hotel with Valid Data
    [Tags]    Booking    Hotels
    Open Browser And Navigate To Page    ${HOTEL_LISTINGS_URL}
    Select Hotel
    Enter Booking Details    Valid details
    Complete Payment
    Check Confirmation Message
    Log    Booking should be successful, and a confirmation message and email should be received.

BH_TC02 Booking a Hotel with Invalid Data
    [Tags]    Booking    Hotels
    Open Browser And Navigate To Page    ${HOTEL_LISTINGS_URL}
    Select Hotel
    Enter Booking Details    Invalid details
    Complete Payment
    Check Error Message
    Log    Error message should be displayed indicating invalid data, and booking should not be completed.

BH_TC03 Modifying a Hotel Booking
    [Tags]    Booking    Hotels
    Open Browser And Navigate To Page    ${HOTEL_LISTINGS_URL}
    Select Hotel
    Enter Booking Details    Valid details
    Complete Payment
    Check Confirmation Message
    Navigate To Booking History
    Select Booking To Modify
    Enter Booking Details    Modified details
    Complete Payment
    Check Confirmation Message
    Log    Booking details should be updated successfully, and confirmation of changes should be received.

# Booking a Flight
BF_TC01 Booking a Flight with Valid Data
    [Tags]    Booking    Flights
    Open Browser And Navigate To Page    ${FLIGHT_LISTINGS_URL}
    Select Flight
    Enter Booking Details    Valid details
    Complete Payment
    Check Confirmation Message
    Log    Booking should be successful, and a confirmation message and email should be received.

BF_TC02 Booking a Flight with Invalid Data
    [Tags]    Booking    Flights
    Open Browser And Navigate To Page    ${FLIGHT_LISTINGS_URL}
    Select Flight
    Enter Booking Details    Invalid details
    Complete Payment
    Check Error Message
    Log    Error message should be displayed indicating invalid data, and booking should not be completed.

BF_TC03 Cancelling a Flight Booking
    [Tags]    Booking    Flights
    Open Browser And Navigate To Page    ${FLIGHT_LISTINGS_URL}
    Select Flight
    Enter Booking Details    Valid details
    Complete Payment
    Check Confirmation Message
    Navigate To Booking History
    Select Booking To Cancel
    Check Cancellation Message
    Log    Booking should be cancelled successfully, and a cancellation confirmation should be received.

# Booking a Tour
BT_TC01 Booking a Tour with Valid Data
    [Tags]    Booking    Tours
    Open Browser And Navigate To Page    ${TOUR_LISTINGS_URL}
    Select Tour
    Enter Booking Details    Valid details
    Complete Payment
    Check Confirmation Message
    Log    Booking should be successful, and a confirmation message and email should be received.

BT_TC02 Booking a Tour with Invalid Data
    [Tags]    Booking    Tours
    Open Browser And Navigate To Page    ${TOUR_LISTINGS_URL}
    Select Tour
    Enter Booking Details    Invalid details
    Complete Payment
    Check Error Message
    Log    Error message should be displayed indicating invalid data, and booking should not be completed.

BT_TC03 Rebooking a Tour
    [Tags]    Booking    Tours
    Open Browser And Navigate To Page    ${TOUR_LISTINGS_URL}
    Select Tour
    Enter Booking Details    Valid details
    Complete Payment
    Check Confirmation Message
    Navigate To Booking History
    Select Booking To Rebook
    Enter Booking Details    Rebook details
    Complete Payment
    Check Confirmation Message
    Log    Rebooking should be successful, and a confirmation message and email should be received.
