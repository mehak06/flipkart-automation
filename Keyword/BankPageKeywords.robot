*** Settings ***
Documentation    Keywords of Checkout Page
Library          Selenium2Library

Resource         ../Locator/BankPage.robot

*** Keywords ***
Verify Bank Screen opens on clicking Pay Now and User takes it's Screenshot
    ${KEYWORD_STATUS}    run keyword and return status  wait until keyword succeeds  2x  1sec  wait until element is visible  ${CORPNET_LOGIN_HEADER}
    run keyword if    ${KEYWORD_STATUS}        log to console     On Cliking PAY NOW button, User is redirected to Bank Screen !!     ELSE   fail  Failed to redirect to Bank Screen on Clicking PAY NOW button. Please check <---------- .......... ERROR !!
    wait until keyword succeeds  2x  1sec  element should be visible  ${CORPORATION_BANK_LOGO}
    wait until keyword succeeds  2x  1sec  element should be visible  ${LOGIN_BUTTON_CORPORATION_BANK}
    ${KEYWORD_STATUS}    run keyword and return status  Location should contain  ${BANK_PAGE_URL}
    run keyword if    ${KEYWORD_STATUS}        log to console     User is on Bank Screen !!     ELSE   fail  Failed to go to Bank Screen on Clicking PAY NOW button. Please check <---------- .......... ERROR !!

    ${KEYWORD_STATUS}    run keyword and return status  Capture Page Screenshot  filename=BankScreen.png
    run keyword if    ${KEYWORD_STATUS}    log to console    Screenshot of Bank Screen is taken Successfully !!    ELSE    fail  Failed to take Screenshot of Bank Screen. Please check <---------- .......... ERROR !!