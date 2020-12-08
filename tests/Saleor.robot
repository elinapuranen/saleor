*** Settings ***
Library  Selenium2Library
Test Setup  Open Browser And Go To Front Page
Test Teardown  Close Browser
Resource  ../resources/keywords.robot

*** Test Cases ***
Typing Wrong Text In The Phone Field Does Not Break The Service 
    User Enters The Saleor Webpage
    User Searches A Product And Adds It To The Cart
    User Goes To The Basket And Starts The Checkout Process As A Guest
    User Enters A Wrong Phone Number And After That Anything Does Not Break

The Payment Process Of Saleor Works Correctly And Secure
    User Enters The Saleor Webpage
    User Searches A Product And Adds It To The Cart
    User Goes To The Basket And Starts The Checkout Process As A Guest
    User Enters The Shipping Address And Chooses The Shipping Method
    User Chooses The Payment Method And It Works Correctly
    The User Is Able To Place The Order

Login As An Admin User Is Possible