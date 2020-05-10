*** Settings ***
Documentation    Keywords of Oppo Mobile Phones Brand Page
Library          Selenium2Library

Resource        ../Locator/CommonPath_Locator.robot

Variables       ../TestData/Product_Page_Data.py

*** Keywords ***
Click on OPPO A83 (Champagne, 16 GB) from OPPO Mobile Phones Page
    ${KEYWORD_STATUS}    run keyword and return status      wait until keyword succeeds  2x  1 sec    wait until element is visible   ${OPPO_A83_Champagne_16GB}
    run keyword if    ${KEYWORD_STATUS}  click element   ${OPPO_A83_Champagne_16GB}     ELSE   Click on View All from Oppo Mobiles under ₹10K widget and then click on OPPO A83 (Champagne, 16 GB)
    ${KEYWORD_STATUS}    run keyword and return status  select window  title=${OPPO_PRODUCT_PAGE_TITLE}
    run keyword if    ${KEYWORD_STATUS}    log to console     User is on Oppo Mobile Phone Product Page  ELSE   fail  Failed to land on OPPO Mobile Phone Product Page. Please check <---------- .......... ERROR !!

Click on View All from Oppo Mobiles under ₹10K widget and then click on OPPO A83 (Champagne, 16 GB)
    ${KEYWORD_STATUS}    run keyword and return status      wait until keyword succeeds  2x  1 sec    click element   ${VIEW_ALL_OPPO_MOBILEPHONES_10K}
    run keyword if    ${KEYWORD_STATUS}    log to console     On clicking View all, "/search" listing page of Oppo Mobile Phones under 10K opened     ELSE   fail  Failed to click on View All from OPPO Mobile Phones Page. Please check <---------- .......... ERROR !!
    wait until keyword succeeds  2x  1sec  wait until element is visible  ${OPPO_MOBILESPHONES_LIST_FILTER}
    wait until keyword succeeds  2x  1sec  element should be visible  ${OPPO_MOBILESPHONES_LIST_FILTER_10K}
    ${KEYWORD_STATUS}    run keyword and return status      wait until keyword succeeds  2x  1sec  wait until element is visible  ${OPPO_A83_CHAMPAGNE_SEARCH_RESULT}
    run keyword if    ${KEYWORD_STATUS}  click element  ${OPPO_A83_CHAMPAGNE_SEARCH_RESULT}