*** Settings ***
Library           SeleniumLibrary
Resource          helpers.robot 
Suite Setup       Open Browser
Suite Teardown    Close Browser

*** Variables ***
${BROWSER}                        Chrome
${SERVICE_BOOKING_URL}            https://www.phptravels.net/bookings
${BookingDetailsField}            id=bookingDetails
${PaymentButton}                  id=paymentBTN
${PayPalOption}                   id=paypalOption
${CreditCardOption}               id=creditCardOption
${CardDetailsField}               id=cardDetails
${SubmitPaymentButton}            id=submitPayment
${ConfirmationMessage}            Booking confirmed
${ReceiptMessage}                 Payment receipt

*** Keywords ***
Open Browser And Navigate To Page
    [Arguments]    ${pageURL}
    Open Browser    ${pageURL}    ${BROWSER}
    Maximize Browser Window

Select Service To Book
    Click Element    xpath=//div[@class='service'][1]//button[text()='Book']

Enter Booking Details
    [Arguments]    ${details}
    Input Text    ${BookingDetailsField}    ${details}

Proceed To Payment
    Click Button    ${PaymentButton}

Select Payment Method
    [Arguments]    ${method}
    Click Element    ${method}

Enter Payment Details And Submit
    [Arguments]    ${details}
    Input Text    ${CardDetailsField}    ${details}
    Click Button    ${SubmitPaymentButton}

Check Confirmation Message
    Page Should Contain    ${ConfirmationMessage}

Check Receipt Message
    Page Should Contain    ${ReceiptMessage}

*** Test Cases ***
# Payment Processing
P_TC01 Payment Processing
    [Tags]    Payment
    Open Browser And Navigate To Page    ${SERVICE_BOOKING_URL}
    Select Service To Book
    Enter Booking Details    Valid details
    Proceed To Payment
    Select Payment Method    ${CreditCardOption}
    Enter Payment Details And Submit    Valid card details
    Check Confirmation Message
    Check Receipt Message
    Log    Payment should be processed successfully, and a receipt should be displayed. User should receive a confirmation email.

P_TC02 Payment via PayPal
    [Tags]    Payment    PayPal
    Open Browser And Navigate To Page    ${SERVICE_BOOKING_URL}
    Select Service To Book
    Enter Booking Details    Valid details
    Proceed To Payment
    Select Payment Method    ${PayPalOption}
    # Assuming some steps to complete payment via PayPal
    Check Confirmation Message
    Check Receipt Message
    Log    Payment should be processed successfully via PayPal, and a receipt should be displayed. User should receive a confirmation email.

P_TC03 Payment via Credit Card
    [Tags]    Payment    CreditCard
    Open Browser And Navigate To Page    ${SERVICE_BOOKING_URL}
    Select Service To Book
    Enter Booking Details    Valid details
    Proceed To Payment
    Select Payment Method    ${CreditCardOption}
    Enter Payment Details And Submit    Valid card details
    Check Confirmation Message
    Check Receipt Message
    Log    Payment should be processed successfully via credit card, and a receipt should be displayed. User should receive a confirmation email.
~