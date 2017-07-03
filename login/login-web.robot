*** Settings ***
Library           Selenium2Library
Resource          th/dataresource.robot
Resource          keyword/keyword-login.robot
Suite Setup       Open Web Shopspot
Test Template     Login Test
Suite Teardown    Close Browser

*** Test Cases ***
Success : Login by Facebook
  ...  ${EMPTY}
  ...  ${EMPTY}
Unsuccess : Require Email&Password
  ...  ${EMPTY}
  ...  ${EMPTY}
Unsuccess : Email are invalid
  ...  qa.shopspot+1000@gmail.com
  ...  root1234
Unsuccess : Password are invalid
  ...  qa.shopspot+1@gmail.com
  ...  root0987
Success : Login by Email&Password
  ...  qa.shopspot+1@gmail.com
  ...  test1234
  

*** Keywords ***
Login Test
  [Arguments]    ${EMAIL}  ${PASSWORD}
  Click SignIn
  Input Email  ${EMAIL}
  Input Password  ${PASSWORD}
  Submit Sign in
  Check Result