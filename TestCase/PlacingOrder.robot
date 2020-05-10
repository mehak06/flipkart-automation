*** Settings ***
Documentation    Test Case for Placing Order on Flipkart
Library          Selenium2Library

Resource         ../Keyword/CommonPath_Keyword.robot
#Resource         ../Keyword/OppoMobilePhones_Page_Keywords.robot
#Resource         ../Keyword/OppoProductPageKeywords.robot
#Resource         ../Keyword/CartPageKeywords.robot
#Resource         ../Keyword/CheckoutPageKeywords.robot
#Resource         ../Keyword/BankPageKeywords.robot

Variables        ../Config/config.py

#Test Timeout    ${TEST_CASE_TIMEOUT}
Suite Setup     Start Timer and Launch Browser
Suite Teardown  Clear Cart, Logout and Close Browser

*** Variables ***
${HOME_PAGE_TITLE}  Online Shopping Site for Mobiles, Electronics, Furniture, Grocery, Lifestyle, Books & More. Best Offers!
${j}  1

*** Test Cases ***
[TC-01] - Verification of Home Page
    [Tags]  Home_Page
    #set selenium implicit wait  8s
    set selenium speed  0.3s
    Verify Title and URL of Flipkart Home Page
    On Home Page Login Pop-up opens and is closed by User
    Verify Home Page has Flipkart Logo, Search and various shopping sections
    #In above keyword do we need to validate login , cart , footer etc?

[TC-02] - Click on OPPO from Electronics/Mobile Section shown on header
    [Tags]  OPPO_SubSection
    Go to Electronics/Mobile Section and its sub-sections will be shown
    Click on Oppo under Electronics/Mobile Section | User redirects to OPPO Mobile Phones Page

[TC-03] - Select OPPO Mobile Phone and Verify it's Product Page
    [Tags]  Select_OppoMobilePhone  OppoProductPage
    Click on OPPO A83 (Champagne, 16 GB) from OPPO Mobile Phones Page
    Verify OPPO A83 (Champagne, 16 GB) (2 GB RAM) Product Page

[TC-04] - Add To Cart the Product if Delivery is Available and redirect to Cart Page
    [Tags]  DeliveryOfProduct  Add_To_Cart  Cart
    Add to Cart OPPO Mobile Phone if it can be delivered in Entered Pincode
    Verify User is redirected to Cart Page after adding Oppo Mobile Phone to Cart

[TC-05] - Verify Product added in Cart is shown on Home Page in Cart's Product Count
    [Tags]  Cart_With_ProductCount
    Click on Flipkart Main Icon on Cart Page and Verify User redirects to Home Page
    Verify On Clicking Cart (with Product Count) On Home Page User Redirects To Cart Page

[TC-06] - Verify Cart has Product, delivery details and options to Increase/ Decrease Quantity, Remove Product
    [Tags]  CartPage
    Verify Product is present in Cart
    Verify on Cart Page option to Increase/ Decrease Quatity, Remove Product and Delivery Date, Pincode are shown

[TC-07] - Verify Calculations of Total Payable Amount
    Verify Product Price Shown On Cart And Product Page Are Equal
    Verify if Delivery is Free then Product Price is Payable Amount and Place Order
    #Various handlings in above test case for multiple products and quantity could have been done

[TC-08] - Verify after Login on Checkout Page, Order Summary, Price Details And Delivery Address are Shown
    [Tags]  Login  OrderSummary
    Verify on Clicking Place Order on Cart, User is redirected to Checkout Page and Login/Sign Up is shown
    Enter User Credentials and Login
    Verify Order Summary, Price Details And Delivery Address Are Shown After Login

[TC-09] - Verify user selects Corporation Bank (Netbanking) from Payment options when Order Confirmation Email is present
    [Tags]  Order_Confirmation_Email  Payment_Options  Netbanking
    Click Continue when User's Order Confirmation Email is Present
    Verify Payment Options are shown after clicking Continue and User selects Corporation Bank from Netbanking

[TC-10] - User takes Screenshot of Bank Screen on clicking Pay Now after selecting Corporation Bank (Netbanking)
    [Tags]  PayNowEnabled  BankScreen_Screenshot
    User clicks Pay Now button after Selecting Corporation Bank (Netbanking)
    Verify Bank Screen opens on clicking Pay Now and User takes it's Screenshot