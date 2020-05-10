*** Settings ***
Documentation    Keywords of Oppo Product Page
Library          Selenium2Library

Resource         ../Locator/OppoProductPage.robot

*** Keywords ***
Verify OPPO A83 (Champagne, 16 GB) (2 GB RAM) Product Page
     wait until keyword succeeds  2x  1sec  wait until element is visible  ${PRODUCT_IMAGE}
     wait until keyword succeeds  2x  1sec  element should be visible      ${ADD_TO_CART}
     wait until keyword succeeds  2x  1sec  element should be visible      ${BUY_NOW}
     wait until keyword succeeds  2x  1sec  element should be visible      ${PRODUCT_PRICE}
     wait until keyword succeeds  2x  1sec  element should be visible      ${PRODUCT_OFFERS}
     wait until keyword succeeds  2x  1sec  element should be visible      ${PRODUCT_SPECIFICATION_HIGHLIGHTS}
     element should contain  ${PRODUCT_SPECIFICATION_HIGHLIGHTS}  ${SIXTEEN_GB_SPEC}
     ${OPPO_MOBILEPH_NAME}  get text  ${PRODUCT_NAME}
     log  ${OPPO_MOBILEPH_NAME}
     set suite variable  ${OPPO_MOBILEPH_NAME}

Add to Cart OPPO Mobile Phone if it can be delivered in Entered Pincode
    wait until keyword succeeds  2x  1sec  element should be visible  ${INPUT_DELIVERY_PINCODE}
    ${KEYWORD_STATUS}  run keyword and return status  input text  ${INPUT_DELIVERY_PINCODE}  ${PINCODE}
    run keyword if    ${KEYWORD_STATUS}    log to console     Pincode is entered by User  ELSE   fail  Failed to Input Pincode on Delivery Dection of OPPO Mobile Phone Product Page. Please check <---------- .......... ERROR !!
    wait until keyword succeeds  2x  1sec  click element  ${DELIVERY_PINCODE_CHECK}
    wait until keyword succeeds  2x  1sec  wait until element is visible  ${DELIVERY_DAY}
    ${KEYWORD_STATUS}  run keyword and return status  wait until keyword succeeds  2x  1sec    element should contain  ${DELIVERY_DAY}  ${DELIVERY_DATE_TEXT}
    run keyword if    ${KEYWORD_STATUS}    log to console    Oppo Mobile Phone can be delivered to Entered Pincode  ELSE   fail  Failed to Deliver OPPO Mobile Phone to Entered Pincode. Please check <---------- .......... ERROR !!

    #Price set as Suite Variable so that it can be used anywhere
    ${PRICE_ON_PRODUCT_PAGE}  get text  ${PRODUCT_PRICE}
    set suite variable  ${PRICE_ON_PRODUCT_PAGE}
    log  ${PRICE_ON_PRODUCT_PAGE}

    ${KEYWORD_STATUS}      run keyword and return status        click element        ${ADD_TO_CART}
    run keyword if    ${KEYWORD_STATUS}     log to console      Oppo Mobile Phone is Added To Cart successfully and User is redirected to CART Page!!      ELSE   fail     Failed to Add Oppo Mobile Phone To Cart over a given time !!