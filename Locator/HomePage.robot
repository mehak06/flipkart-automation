*** Variables ***

#Home Page
#${CANCEL_LOGIN_POPUP}                   xpath=//button[@class='_2AkmmA _29YdH8']
${CANCEL_LOGIN_POPUP}                   css=button._2AkmmA._29YdH8
#${LOGIN_POPUP}                          xpath=//div[@class="_32LSmx"]
${LOGIN_POPUP}                          css=div._32LSmx
#${FLIPKART_LOGO}                        xpath=//div[@class="_1T-JyI"]
${FLIPKART_LOGO}                        css=div._1T-JyI

${SEARCH_BAR}                           xpath=//form[@action="/search"]

#${PRODUCT_SECTIONS_ON_HEADER}           xpath=//div[@class="_3zdbog _3Ed3Ub"]
${PRODUCT_SECTIONS_ON_HEADER}           css=div._3zdbog._3Ed3Ub

${ELECTRONIC_SECTION_ON_HEADER}         xpath=//li[@class="Wbt_B2 _1YVU3_"][1]
${SUBSECTION_UNDER_ELECTRONIC_SECTION}  xpath=(//ul[@class="_2OZ78M _1fj2FQ"])[1]

#${MOBILES_SUBSECTION}                   xpath=//a[@title="Mobiles"]
${MOBILES_SUBSECTION}                   css=a[title=Mobiles]

${OPPO_ELECTRONICS_SECTION}             xpath=//a[@href="/oppo-mobile-phones-store?otracker=nmenu_sub_Electronics_0_OPPO"]

${PRODUCT_COUNT_IN_CART}                css=div._2dcihZ