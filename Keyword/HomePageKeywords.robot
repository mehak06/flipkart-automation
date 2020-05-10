*** Settings ***
Documentation    Keywords of Home Page
Library          Selenium2Library
#Library          DateTime

Resource         ../Locator/CommonPath_Locator.robot

*** Keywords ***
Start Timer and Launch Browser
    #${START_TIME} =  Get Current Date  result_format=%H:%M:%S
    #set selenium implicit wait  15s
    set selenium speed  0.3s
    ${START_TIME} =   get time
    set global variable    ${START_TIME}
    log to console  ${START_TIME} : Build Start Time

    ${KEYWORD_STATUS}      run keyword and return status       open browser   ${URL}  ${BROWSER_CHROME}
    run keyword if    ${KEYWORD_STATUS}        log to console   Launched chrome browser via xvfb successfully !!     ELSE    fail   Failed to launch chrome browser. Please check <---------- .......... ERROR !!
    # maximize_browser_window
    ${KEYWORD_STATUS}      run keyword and return status      set_window_size      ${1440}     ${1050}
    run keyword if    ${KEYWORD_STATUS}      log to console    Set chrome window size as 1440 x 1050        ELSE   fail   Failed to set chrome window size. Please check  <---------- .......... ERROR !!

Verify Title and URL of Flipkart Home Page
    ${KEYWORD_STATUS}    run keyword and return status  Location should be  ${URL}
    run keyword if    ${KEYWORD_STATUS}        log to console     User is on Flipkart Home Page !!     ELSE   fail  Failed to go to Flipkart Home Page. Please check <---------- .......... ERROR !!
    wait until keyword succeeds  2x  1sec  title should be  ${HOME_PAGE_TITLE}

On Home Page Login Pop-up opens and is closed by User
    wait until keyword succeeds  2x  1sec  wait until element is visible       ${LOGIN_POPUP}
    ${KEYWORD_STATUS}      run keyword and return status        click element  ${CANCEL_LOGIN_POPUP}
    run keyword if    ${KEYWORD_STATUS}     log to console      On Home Page Login Pop-up found and closed it successfully !!      ELSE   fail     Failed to close Login Pop-Up on Flipkart homepage over a given time !!

Verify Home Page has Flipkart Logo, Search and various shopping sections
    wait until keyword succeeds  2x  1sec  element should be visible  ${FLIPKART_LOGO}
    wait until keyword succeeds  2x  1sec  element should be visible  ${SEARCH_BAR}
    wait until keyword succeeds  2x  1sec  element should be visible  ${PRODUCT_SECTIONS_ON_HEADER}

Go to Electronics/Mobile Section and its sub-sections will be shown
    ${KEYWORD_STATUS}    run keyword and return status      wait until keyword succeeds  2x  1 sec    mouse over   ${ELECTRONIC_SECTION_ON_HEADER}
    run keyword if    ${KEYWORD_STATUS}        log to console     Mouse Over on Electronics Section !!     ELSE   fail  Failed to mouse over on Electronics Section on Homepage. Please check <---------- .......... ERROR !!
    ${KEYWORD_STATUS}    run keyword and return status      wait until keyword succeeds  2x  1 sec    element should be visible  ${SUBSECTION_UNDER_ELECTRONIC_SECTION}
    run keyword if    ${KEYWORD_STATUS}        log to console     Sub-sections of Electronics Section are shown !!     ELSE   fail  Failed to show sub-sections of Electronics Section on Homepage. Please check <---------- .......... ERROR !!
    ${KEYWORD_STATUS}    run keyword and return status      wait until keyword succeeds  2x  1 sec    wait until element is visible   ${MOBILES_SUBSECTION}
    run keyword if    ${KEYWORD_STATUS}        log to console     Mobiles Sub-section is shown !!     ELSE   fail  Failed to show Mobiles sub-sections. Please check <---------- .......... ERROR !!

Click on Oppo under Electronics/Mobile Section | User redirects to OPPO Mobile Phones Page
    ${KEYWORD_STATUS}    run keyword and return status      wait until keyword succeeds  2x  1 sec    click element   ${OPPO_ELECTRONICS_SECTION}
    run keyword if    ${KEYWORD_STATUS}        log to console     Click on Oppo !!     ELSE   fail  Failed to click on OPPO. Please check <---------- .......... ERROR !!
    ${KEYWORD_STATUS}    run keyword and return status  Location should be  ${OPPO_MOBILEPHONE_PAGE_URL}
    run keyword if    ${KEYWORD_STATUS}        log to console     User is on correct OPPO Mobile Phone URL !!     ELSE   fail  Failed to go to OPPO Mobile Phone URL. Please check <---------- .......... ERROR !!
    wait until keyword succeeds  2x  1 sec    wait until element is visible   ${OPPO_MOBILESPHONES_UNDER_10K}

Verify on Clicking Cart (with product count) on Home Page User redirects to Cart Page
    wait until keyword succeeds  2x  1 sec    element should be visible        ${PRODUCT_COUNT_IN_CART}
    ${KEYWORD_STATUS}      run keyword and return status        click element  ${PRODUCT_COUNT_IN_CART}
    run keyword if    ${KEYWORD_STATUS}     log to console      On Clicking Cart on Home Page user lands to Cart Page successfully !!      ELSE   fail     Failed to click Cart on Flipkart homepage over a given time !!
