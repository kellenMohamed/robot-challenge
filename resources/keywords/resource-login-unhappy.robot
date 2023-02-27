*** Settings ***

Documentation           Aqui estarão presentes todas as keywords / ações que
...                     compoem os testes de automação web.


Library                 SeleniumLibrary
Library                 String
Library                 Process

Resource                resource.robot

*** Variable ***

${Browser}          chrome
${URL}              https://www.saucedemo.com/
${user}             standard_user
${psw}              secret_sauce
${FirstNameXSS}     <SCRIPT type="text/javascript">var adr = '../evil.php?cakemonster=' + escape(document.cookie);</SCRIPT>
${LastNameXSS}      <SCRIPT type="text/javascript">var adr = '../evil.php?cakemonster=' + escape(document.cookie);</SCRIPT>
${ZipCodeXSS}       <SCRIPT type="text/javascript">var adr = '../evil.php?cakemonster=' + escape(document.cookie);</SCRIPT>
@{FirstNameList}   
...                 Test FirstName     
...                 123    
...                 @!*
@{LastNameList}   
...                 Test LastName     
...                 123    
...                 @@@#$$%
@{ZipCodeList}   
...                 13456
...                 1345689 
...                 134569090
...                 134@689    
...                 !345689
...                 text
${mensagem_esperada}    Error: First Name is required


${invalidUser}    
...                 test@test.com
...                 standard_use
...                 1234569
...                 stand@rd_user
...                 standard_us3r
...                 standard_userstandard_userstandard_userstandard_userstandard_user
                    
${invalidPsw}       secret_saucer
...                 test@test.com
...                 standard_use
...                 1234569
...                 stand@rd_user
...                 standard_us3r
...                 secret_saucesecret_saucesecret_saucesecret_saucesecret_saucesecret_sauce


*** Keywords ***

Abrir pagina unahppy
    Abrir pagina
Realizar o Login user e psw invalidos unhappy
    Input Text                          xpath=//*[@id="user-name"]        ${invalidUser}
    Sleep    1s
    Input Text                          xpath=//*[@id="password"]         ${invalidPsw}
    Sleep    1s
    Click Element                       xpath=//*[@id="login-button"]
    #Element Should Be Visible           xpath=//*[@id="login_button_container"]/div/form/div[3]/h3/text()
    #Should be Equal                     xpath=//*[@id="login_button_container"]/div/form/div[3]/h3/text()    Epic sadface: Username and password do not match any user in this service
    Sleep    1s
    Log To Console                      "Step 'Realizar o Login user e psw invalidos unhappy' worked"

Realizar o Login user invalido unhappy
    Input Text                          xpath=//*[@id="user-name"]        ${invalidUser}
    Sleep    1s
    Input Text                          xpath=//*[@id="password"]         ${psw}
    Sleep    1s
    Click Element                       xpath=//*[@id="login-button"]
    #Should be Equal                     xpath=//*[@id="login_button_container"]/div/form/div[3]/h3/text()    Epic sadface: Username and password do not match any user in this service
    Sleep    1s
    Log To Console                      "Step 'Realizar o Login user invalido unhappy"

Realizar o Login pws invalido unhappy
    Input Text                          xpath=//*[@id="user-name"]        ${user}
    Sleep    1s
    Input Text                          xpath=//*[@id="password"]         ${invalidPsw}
    Sleep    1s
    Click Element                       xpath=//*[@id="login-button"]
    #Should be Equal                     xpath=//*[@id="login_button_container"]/div/form/div[3]/h3/text()    Epic sadface: Username and password do not match any user in this service
    Sleep    1s
    Log To Console                      "Step 'Realizar o Login pws invalido unhappy' worked"

Fechar o Navegador unahppy
    Close Browser
    Log To Console                       "Step 'Fechar o Navegador - unhappy' worked"
