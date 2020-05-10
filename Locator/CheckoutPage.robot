*** Variables ***

# Pre-Login
${LOGIN_SIGNUP_CHECKOUT_PAGE}             css=h3._1fM65H._2RMAtd
${ENTER_EMAIL_MOBILENUM}                  css=input._2zrpKA._3X0qwn[type='text']
${CONTINUE_BUTTON_POST_EMAIL}             css=button._2AkmmA.T7K48m._7UHT_c
${ENTER_PASSWORD}                         css=input._2zrpKA._3v41xv._3X0qwn[type='password']
${LOGIN_BUTTON}                           css=button._2AkmmA.T7K48m._7UHT_c

# Post-Login
${EXISTING_DELIVERY_ADDRESS}              xpath=(//div[@class='_2jDL7w'])[2]
${OPPO_MOBILEPHONE_ORDERSUMMARY}          css=div._325-ji
${OPPO_MOBILEPHONE_IMAGE}                 css=img._1Nyybr._30XEf0
${TOTAL_PAYABLE_CHECKOUT_PAGE}            xpath=(//div[@class='_2tarGe _1t3GGY'])[2]

${ORDER_CONFIRMATION_EMAIL_PLACEHOLDER}   css=input[placeholder='Enter your email ID']
${CONTINUE_BUTTON}                        css=button._2AkmmA._2Q4i61._7UHT_c

${PAYMENT_OPTIONS}                        css=div._1GRhLX._17_fE5
${NETBANKING}                             xpath=//label[@for='NET_OPTIONS']
${BANK_SELECTION}                         css=div._2EqlMg
${SELECT_BANK_DROPDOWN}                   css=select._1CV081
${CORPORATION_BANK}                       css=option[value='CORPORATION']
${PAY_NOW_BUTTON}                         css=button._2AkmmA._2BikcQ._7UHT_c