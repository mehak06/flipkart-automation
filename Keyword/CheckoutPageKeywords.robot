*** Settings ***
Documentation    Keywords of Checkout Page
Library          Selenium2Library

Resource         ../Locator/CheckoutPage.robot

*** Keywords ***
Verify on Clicking Place Order on Cart, User is redirected to Checkout Page and Login/Sign Up is shown
    ${KEYWORD_STATUS}  run keyword and return status  Location should be  ${CHECKOUT_PAGE_URL}
    run keyword if     ${KEYWORD_STATUS}        log to console     User is on Checkout Page !!     ELSE   fail  Failed to Open Checkout Page. Please check <---------- .......... ERROR !!
    wait until keyword succeeds  2x  1sec  wait until element is visible  ${LOGIN_SIGNUP_CHECKOUT_PAGE}

Enter User Credentials and Login
    wait until keyword succeeds  2x  1sec  element should be visible  ${ENTER_EMAIL_MOBILENUM}
    input text  ${ENTER_EMAIL_MOBILENUM}  ${MOBILE_NUM}
    wait until keyword succeeds  2x  1sec  click element  ${CONTINUE_BUTTON_POST_EMAIL}
    wait until keyword succeeds  2x  1sec  wait until element is visible  ${ENTER_PASSWORD}
    input password  ${ENTER_PASSWORD}   ${PASSWORD}
    ${KEYWORD_STATUS}  run keyword and return status  wait until keyword succeeds  2x  1sec  click element  ${LOGIN_BUTTON}
    run keyword if     ${KEYWORD_STATUS}        log to console     User has Entered Mobile Number and Password, Login is Successful !!     ELSE   fail  User could not Login. Please check <---------- .......... ERROR !!

Verify Order Summary, Price Details and Delivery Address are shown after Login
    #Delivery Address
    ${KEYWORD_STATUS}  run keyword and return status      wait until keyword succeeds  2x  1sec  wait until element is visible  ${EXISTING_DELIVERY_ADDRESS}
    run keyword if     ${KEYWORD_STATUS}  log to console  Delivery Address is already added by User !!     ELSE   fail  Delivery Address not shown, might need to ADD new Delivery Address on Checkout Page. Please check <---------- .......... ERROR !!

    #Order Summary
    ${OPPO_MOBILEPHONE_NAME_ORDERSUMMARY}   get text  ${OPPO_MOBILEPHONE_ORDERSUMMARY}
    log  ${OPPO_MOBILEPHONE_NAME_ORDERSUMMARY}
    ${KEYWORD_STATUS}  run keyword and return status  should be equal  ${OPPO_MOBILEPHONE_NAME_ORDERSUMMARY}  ${OPPO_MOBILEPH_NAME_IN_CART}
    run keyword if     ${KEYWORD_STATUS}    log to console    Oppo Mobile Phone present in Cart and Order Summary are same!!     ELSE   fail  Oppo Mobile Phone present in Cart and Order Summary are not the same. Please check <---------- .......... ERROR !!
    #Similar to Cart Page Quantity Increase/ Decrease, Product Remove, Price of Product and its Delivery Date can be validated on Checkout Page (Order Summary)

    #Price Details
    wait until keyword succeeds  2x  1sec  element should be visible  ${TOTAL_PAYABLE_CHECKOUT_PAGE}
    ${TOTAL_AMOUNT_CHECKOUT}  get text  ${TOTAL_PAYABLE_CHECKOUT_PAGE}
    log  ${TOTAL_AMOUNT_CHECKOUT}
    should be equal  ${TOTAL_AMOUNT_CHECKOUT}  ${TOTAL_AMOUNT_CART}

Click Continue when User's Order Confirmation Email is Present
    ${KEYWORD_STATUS}  run keyword and return status  wait until keyword succeeds  2x  1sec  element should be disabled  ${ORDER_CONFIRMATION_EMAIL_PLACEHOLDER}
    run keyword if     ${KEYWORD_STATUS}        log to console     Order Confirmation Email Id is already present so Input field to enter Order Confirmation Email Id is disabled !!     ELSE   fail  Order Confirmation Email Id is NOT present, so need to enter it in Input field . Please check <---------- .......... ERROR !!
    wait until keyword succeeds  2x  1sec  click element  ${CONTINUE_BUTTON}

Verify Payment Options are shown after clicking Continue and User selects Corporation Bank from Netbanking
    ${KEYWORD_STATUS}  run keyword and return status  wait until keyword succeeds  2x  1sec  wait until element is visible  ${PAYMENT_OPTIONS}
    run keyword if     ${KEYWORD_STATUS}        log to console     Payment Options(PhonePe, Card, Netbanking, EMI, COD and Gift Card) are shown after Clicking Continue !!     ELSE   fail  Failed to Show Payment Options on Checkout Page. Please check <---------- .......... ERROR !!
    wait until keyword succeeds  2x  1sec  click element  ${NETBANKING}
    ${KEYWORD_STATUS}  run keyword and return status  wait until keyword succeeds  2x  1sec  element should be disabled  ${PAY_NOW_BUTTON}
    run keyword if     ${KEYWORD_STATUS}        log to console     As Bank is not selected under NetBanking, PAY NOW Button is Disabled !!     ELSE   fail  Check if Pay Now Button is visible or enabled. Please check <---------- .......... ERROR !!
    wait until keyword succeeds  2x  1sec  wait until element is visible  ${BANK_SELECTION}
    wait until keyword succeeds  2x  1sec  element should be visible  ${SELECT_BANK_DROPDOWN}
    wait until keyword succeeds  2x  1sec  click element  ${SELECT_BANK_DROPDOWN}
    wait until keyword succeeds  2x  1sec  wait until element is visible  ${CORPORATION_BANK}
    ${KEYWORD_STATUS}  run keyword and return status  wait until keyword succeeds  2x  1sec  click element  ${CORPORATION_BANK}
    run keyword if     ${KEYWORD_STATUS}        log to console     User has Selected Corporation Bank from Dropdown  !!     ELSE   fail  Failed to Select Corporation Bank from Dropdown. Please check <---------- .......... ERROR !!

User clicks Pay Now button after Selecting Corporation Bank (Netbanking)
    wait until keyword succeeds  2x  1sec  wait until element is visible  ${PAY_NOW_BUTTON}
    ${KEYWORD_STATUS}  run keyword and return status  wait until keyword succeeds  2x  1sec  element should be enabled  ${PAY_NOW_BUTTON}
    run keyword if     ${KEYWORD_STATUS}        log to console     After Selecting Corporation Bank PAY NOW button is Enabled !!     ELSE   fail  Failed to Enable PAY NOW button or PAY NOW button is not shown. Please check <---------- .......... ERROR !!
    wait until keyword succeeds  2x  1sec  click element  ${PAY_NOW_BUTTON}