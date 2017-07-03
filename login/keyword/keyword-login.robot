*** Keywords ***
Open Web Shopspot
  Open Browser  ${URL}  ${BROWSER}
  Title Should Be  Shopspot - Awesome market place in your pocket
  Set Selenium Speed  0.5s

Click SignIn
  Focus    xpath=//*[@id="header"]/div[2]/div/ul/li[2]/a/button/span
  Click Element    xpath=//*[@id="header"]/div[2]/div/ul/li[2]/a/button/span

Input Email
  [Arguments]    ${EMAIL}
  Input Text    xpath=/html/body/div[3]/div/div[2]/div/div/div/div[2]/div[2]/form/div[1]/input  ${EMAIL}

Input Password
  [Arguments]    ${PASSWORD}
  Input Text    xpath=/html/body/div[3]/div/div[2]/div/div/div/div[2]/div[2]/form/div[2]/input  ${PASSWORD}

Submit Sign in
  Click Element    xpath=/html/body/div[3]/div/div[2]/div/div/div/div[2]/div[2]/form/div[3]/button

Check Result
  Run Keyword If    '${TEST_NAME}' == 'Success : Login by Facebook'    Login by Facebook
  ...  ELSE IF    '${TEST_NAME}' == 'Success : Login by Email&Password'    Result Success
  ...  ELSE IF    '${TEST_NAME}' == 'Unsuccess : Require Email&Password'    Result Require Email&Password
  ...  ELSE IF    '${TEST_NAME}' == 'Unsuccess : Email are invalid'    Email are invalid
  ...  ELSE IF    '${TEST_NAME}' == 'Unsuccess : Password are invalid'    Password are invalid

Result Success
  Focus    xpath=//*[@id="header"]/div[2]/div/ul/li[3]/div/button/div[2]/span
  Element Should Contain    xpath=//*[@id="header"]/div[2]/div/ul/li[3]/div/button/div[2]/span    You
  Element Should Be Visible    xpath=//*[@id="header"]/div[2]/div/ul/li[3]/div/button/div[1]/div
  Logout

Login by Facebook
  log    Manual Test
  Click X

Result Require Email&Password
  Wait Until Keyword Succeeds  10x  2s  Element Should Contain  xpath=/html/body/div[3]/div/div[2]/div/div/div/div[2]/div[2]/form/div[1]/span/span/span[2]  Email is required.
  Wait Until Keyword Succeeds  10x  2s  Element Should Contain  xpath=/html/body/div[3]/div/div[2]/div/div/div/div[2]/div[2]/form/div[2]/span/span/span[2]  Password is required.
  Click X

Email are invalid
  Wait Until Keyword Succeeds  10x  2s  Element Should Contain  xpath=/html/body/div[3]/div/div[2]/div/div/div/div[2]/div[2]/form/div[3]/p/span[1]/span   Incorrect email or password
  Wait Until Keyword Succeeds  10x  2s  Element Should Contain  xpath=/html/body/div[3]/div/div[2]/div/div/div/div[2]/div[2]/form/div[3]/p/span[2]  Make sure your email and password are both correct
  Click X

Password are invalid
  Wait Until Keyword Succeeds  10x  2s  Element Should Contain  xpath=/html/body/div[3]/div/div[2]/div/div/div/div[2]/div[2]/form/div[3]/p/span[1]/span   Incorrect email or password
  Wait Until Keyword Succeeds  10x  2s  Element Should Contain  xpath=/html/body/div[3]/div/div[2]/div/div/div/div[2]/div[2]/form/div[3]/p/span[2]  Make sure your email and password are both correct
  Click X

Click X
  Wait Until Keyword Succeeds  10x  2s    Click Element    xpath=//html/body/div[3]/div/div[2]/div/div/div/div[1]/button/i


Logout
  Click Element    xpath=//*[@id="header"]/div[2]/div/ul/li[3]/div/button/div[2]/span
  Click Element    xpath=//*[@id="header"]/div[2]/div/ul/li[3]/div/ul/li[7]/a