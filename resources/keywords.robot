*** Variables ***
${URL}  https://demo.saleor.io
${BROWSER}  firefox

*** Keywords ***
Open Browser And Go To Front Page
    Open Browser  ${URL}  ${BROWSER}

Scroll Page To Location
    [Arguments]    ${x_location}    ${y_location}
    Execute JavaScript    window.scrollTo(${x_location},${y_location})

User Enters The Saleor Webpage
    Wait Until Page Contains Element  id=header

User Searches A Product And Adds It To The Cart
    Click Element  //li[@class='main-menu__search']
    Input Text  //input[@placeholder='search']  T-Shirt
    Wait Until Page Contains Element  //a[@href='/product/t-shirt/113/']
    Click Link  //a[@href='/product/t-shirt/113/']
    Wait Until Page Contains Element  size
    Click Element  size
    Click Element  //div[text()='S']
    Click Element  //span[text()='Add to basket']

User Goes To The Basket And Starts The Checkout Process As A Guest
    Wait Until Page Contains Element  //span[text()='Go to my bag']
    Click Element  //span[text()='Go to my bag']
    Wait Until Page Contains Element  //span[text()='PROCEED TO CHECKOUT']
    Click Element  //span[text()='PROCEED TO CHECKOUT']
    Wait Until Page Contains Element  //a[@href='/checkout/']
    Click Element  //a[@href='/checkout/']

User Enters A Wrong Phone Number And After That Anything Does Not Break
    Input Text  firstName  Teemu
    Input Text  lastName  Teekkari
    Input Text  phone  Teekkari
    Input Text  streetAddress1  Jämeräntaival 1A 111
    Input Text  city  Espoo
    Input Text  postalCode  02150
    Click Element  //div[@class='css-133ddnz-control select-country__control']
    Click Element  //div[text()='Finland']
    Input Text  countryArea  Uusimaa
    Input Text  email  teemu.teekkari@test.fi
    Click Element  //div[text()='Same as shipping address']
    Click Element  //span[text()='CONTINUE TO SHIPPING']
    Wait Until Page Contains Element  //p[text()="'Teekkari' is not a valid phone number."]

User Enters The Shipping Address And Chooses The Shipping Method
    Input Text  firstName  Teemu
    Input Text  lastName  Teekkari
    Input Text  phone  +358401234567
    Input Text  streetAddress1  Jämeräntaival 1A 111
    Input Text  city  Espoo
    Input Text  postalCode  02150
    Click Element  //div[@class='css-133ddnz-control select-country__control']
    Click Element  //div[text()='Finland']
    Input Text  countryArea  Uusimaa
    Input Text  email  teemu.teekkari@test.fi
    Click Element  //div[text()='Same as shipping address']
    Click Element  //span[text()='CONTINUE TO SHIPPING']
    Scroll Page To Location  0  2000
    Wait Until Page Contains Element  //div[@class='sc-jbKcbu eHsgwN']//span[@class='sc-feryYK kSzumH']
    Click Element  //div[@class='sc-jbKcbu eHsgwN']//span[@class='sc-feryYK kSzumH']
    Click Element  //span[text()='CONTINUE TO PAYMENT']

User Chooses The Payment Method And It Works Correctly
    Wait Until Page Contains Element  //h3[text()='PAYMENT METHOD']
    Click Element  //div[@class='sc-jbKcbu eHsgwN']
    Click Element  //span[text()='CONTINUE TO REVIEW']

The User Is Able To Place The Order
    Wait Until Page Contains Element  //h3[text()='REVIEW ORDER']
    Click Element  //span[text()='PLACE ORDER']
