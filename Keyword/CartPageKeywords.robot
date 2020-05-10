*** Settings ***
Documentation    Keywords of Cart Page
Library          Selenium2Library

Resource         ../Locator/CartPage.robot

Resource         CommonPath_Keyword.robot

Variables        ../TestData/Cart_Page_Data.py
Variables        ../TestData/Product_Page_Data.py

*** Keywords ***
Verify User is redirected to Cart Page after adding Oppo Mobile Phone to Cart
    ${KEYWORD_STATUS}    run keyword and return status  wait until keyword succeeds  2x  1sec  wait until element is visible  ${PLACE_ORDER_BUTTON_CART}
    run keyword if       ${KEYWORD_STATUS}    log to console    User is on Flipkart Cart Page after Adding Oppo Mobile Phone to Cart Page!!     ELSE   fail  Failed to go to Flipkart Cart Page. Please check <---------- .......... ERROR !!
    title should be      ${CART_PAGE_TITLE}
    location should be   ${CART_PAGE_URL_GoToCart}

Click on Flipkart Main Icon on Cart Page and Verify User redirects to Home Page
    ${KEYWORD_STATUS}  run keyword and return status  wait until keyword succeeds  2x  1sec  click element  ${FLIPKART_LOGO}
    run keyword if     ${KEYWORD_STATUS}    log to console    On Cart Page Clicked on Flipkart Main Icon so that user redirects to Home Page!!     ELSE   fail  Failed to Click on Flipkart Main Icon and User cannot redirect to Home Page now. Please check <---------- .......... ERROR !!
    Verify Title and URL of Flipkart Home Page

Verify Product is present in Cart
    wait until keyword succeeds  2x  1sec  title should be    ${CART_PAGE_TITLE}
    ${KEYWORD_STATUS}  run keyword and return status  location should be  ${CART_PAGE_URL_Cart_Icon_Click}
    run keyword if     ${KEYWORD_STATUS}    log to console    User is On Cart Page !!     ELSE   fail  Failed to open Cart Page now. Please check <---------- .......... ERROR !!
    ${OPPO_MOBILEPH_NAME_IN_CART}  get text  ${OPPO_MOBILEPHONE_IN_CART}
    log  ${OPPO_MOBILEPH_NAME_IN_CART}
    set suite variable  ${OPPO_MOBILEPH_NAME_IN_CART}
    ${KEYWORD_STATUS}   run keyword and return status  should contain  ${OPPO_MOBILEPH_NAME}  ${OPPO_MOBILEPH_NAME_IN_CART}
    run keyword if      ${KEYWORD_STATUS}    log to console    Oppo Mobile Phone present in Cart is same as the one added from Oppo Mobile Phone Product Page !!     ELSE   fail  Oppo Mobile Phone present in Cart is not same as the one added from Oppo Mobile Phone Product Page. Please check <---------- .......... ERROR !!

Verify on Cart Page option to Increase/ Decrease Quatity, Remove Product and Delivery Date, Pincode are shown
    ${KEYWORD_STATUS}  run keyword and return status  wait until keyword succeeds  2x  1sec  element should contain  ${DELIVERY_PINCODE_ON_CART}  ${PINCODE}
    run keyword if     ${KEYWORD_STATUS}    log to console    Cart is showing same Delivery Pincode which User Entered on OPPO Mobile Phone Product Page to check its Delivery Date.     ELSE   fail  Delivery Pincode shown on Cart is not the same which User Entered on OPPO Mobile Phone Product Page. Please check <---------- .......... ERROR !!
    wait until keyword succeeds  2x  1sec  element should be visible    ${DELIVERY_DATE_ON_CART}
    wait until keyword succeeds  2x  1sec  element should be visible    ${REMOVE_BUTTON_CART}
    wait until keyword succeeds  2x  1sec  element should be visible    ${INCREASE_QUANTITY}
    ${KEYWORD_STATUS}  run keyword and return status  wait until keyword succeeds  2x  1sec  element should be disabled   ${DECREASE_QUANTITY}
    run keyword if     ${KEYWORD_STATUS}    log to console    As Quantity is 1, Decrease Quantity button is Disabled on Cart !!     ELSE   fail  Decrease Quantity button is not Disabled either the button is not shown or the Quantity is greater than 1. Please check <---------- .......... ERROR !!

Verify Product Price shown on Cart and Product Page are equal
    wait until keyword succeeds  2x  1sec  element should be visible    ${PRODUCT_PRICE_CART_PAGE}
    ${PRODUCT_PRICE_ON_CART_PAGE}  get text  ${PRODUCT_PRICE_CART_PAGE}
    log  ${PRODUCT_PRICE_ON_CART_PAGE}
    set suite variable  ${PRODUCT_PRICE_ON_CART_PAGE}
    should be equal     ${PRODUCT_PRICE_ON_CART_PAGE}  ${PRICE_ON_PRODUCT_PAGE}

Verify if Delivery is Free then Product Price is Payable Amount and Place Order
    ${KEYWORD_STATUS}  run keyword and return status  element text should be  ${FREE_DELIVERY_CART}  ${FREE}
    run keyword if     ${KEYWORD_STATUS}    log to console    Delivery is Free for the Product in Cart !!    ELSE   fail  Delivery is not Free for the Product in Cart now. Please check <---------- .......... ERROR !!
    wait until keyword succeeds  2x  1sec  element should be visible    ${TOTAL_PAYABLE_AMOUNT}
    ${TOTAL_AMOUNT_CART}  get text  ${TOTAL_PAYABLE_AMOUNT}
    log  ${TOTAL_AMOUNT_CART}
    set suite variable  ${TOTAL_AMOUNT_CART}
    ${KEYWORD_STATUS}   run keyword and return status  should be equal  ${TOTAL_AMOUNT_CART}  ${PRODUCT_PRICE_ON_CART_PAGE}
    run keyword if      ${KEYWORD_STATUS}    log to console    As Delivery is Free for the Product, Total Amount is equal to Product Price  !!    ELSE   fail  Delivery is Free but Total Amount is NOT equal to Product Price. Please check <---------- .......... ERROR !!
    wait until keyword succeeds  2x  1sec  click element  ${PLACE_ORDER_BUTTON_CART}

Clear Cart, Logout and Close Browser
    Click on Flipkart Main Icon on Cart Page and Verify User redirects to Home Page
    Verify on Clicking Cart (with product count) on Home Page User redirects to Cart Page
    ${KEYWORD_STATUS}   run keyword and return status   wait until keyword succeeds  2x  1sec  wait until element is visible    ${PLACE_ORDER_BUTTON_CART}
    run keyword if    ${KEYWORD_STATUS}    Clear cart logic    ELSE   log   No items in the cart. So, no need to remove items from cart.
    ${KEYWORD_STATUS}    run keyword and return status   wait until keyword succeeds  2x   1sec   wait until element is visible  ${LOGGED_IN_USER}
    run keyword if   ${KEYWORD_STATUS}     Select Logout and Close Browser      ELSE  log  User is not logged into their account.

Clear cart logic

    ${COUNTS_ITEMS}  Get Element Count   ${REMOVE_BUTTON_CART}
    log  ${j}
    :FOR  ${j}  IN RANGE  0   ${COUNTS_ITEMS}
    \  log  ${j}
    \   wait until keyword succeeds  6x  2seconds  Remove Product from Cart
    \   ${STATUS}   run keyword and return status   wait until element is visible  ${NO_ITEM_CART_SHOP_NOW}
    \   exit for loop if   ${STATUS}

Remove Product from Cart
        wait until keyword succeeds  6x  2seconds  wait until element is visible  ${REMOVE_BUTTON_CART}
        wait until keyword succeeds  6x  2seconds  click element  ${REMOVE_BUTTON_CART}
        wait until keyword succeeds  6x  2seconds  wait until element is visible  ${REMOVE_BUTTON_POPUP}
        ${KEYWORD_STATUS}   run keyword and return status    wait until keyword succeeds  6x  2seconds  click element  ${REMOVE_BUTTON_POPUP}
        run keyword if  ${KEYWORD_STATUS}  log to console    Product is removed from Cart.     ELSE   log to console  Unable to Remove Product from Cart. Please check <---------- .......... ERROR !!

Select Logout and Close Browser
    Page Should Contain Element    ${LOGGED_IN_USER}
    wait until keyword succeeds  5x  1sec  mouse over   ${LOGGED_IN_USER}
    ${KEYWORD_STATUS}   run keyword and return status    wait until keyword succeeds  5x  1sec  click element    ${LOGOUT_BUTTON}
    run keyword if  ${KEYWORD_STATUS}  log to console     Click on the logout button.     ELSE   log to console  Unable to click on the logout button. Please check <---------- .......... ERROR !!
    Close Browser