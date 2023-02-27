*** Settings ***

Documentation           Aqui estarão presentes todas as keywords / ações que
...                     compoem os testes de automação web.


Library                 SeleniumLibrary
Library                 String
Library                 Process

Resource         resource.robot

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

### Setup e Teardown
Abrir pagina unahppy
    Abrir pagina

Realizar o Login unahppy
    Realizar o Login

Visualizar o produto "Sauce Labs Backpack" e seu valor unahppy
    Visualizar o produto "Sauce Labs Backpack" e seu valor

Adicionar Itens ao carrinho unahppy
    Adicionar Itens ao carrinho

Remover os produtos unahppy
    Remover os produtos

Verificar carrinho unahppy
    Verificar carrinho

Incluir Dados de Postagem unhappy
    Click Button                          xpath=//*[@id="continue"]
    Element Should Contain                xpath=//*[@id="checkout_info_container"]/div/form/div[1]/div[4]    Error: First Name is required
    Sleep   1s
    FOR    ${FirstNameList}    IN    @{FirstNameList}
        Input Text                          id=first-name           ${FirstNameList}
        Sleep   1s        
    END
    
    FOR    ${LastNameList}    IN    @{LastNameList}
        Input Text                          id=last-name            ${LastNameList}
        Sleep   1s        
    END
    
    FOR    ${ZipCodeList}    IN    @{ZipCodeList}
        Input Text                          id=postal-code          ${ZipCodeList}
        Sleep   1s        
    END

    Input Text                          id=first-name           ${None}
    Input Text                          id=last-name            ${None}
    Input Text                          id=postal-code          ${None}
    Sleep    1s
    
    Input Text                          id=first-name           ${EMPTY}
    Input Text                          id=last-name            ${EMPTY}
    Input Text                          id=postal-code          ${EMPTY}
    Sleep    1s
    
    Input Text                          id=first-name           ${FirstNameXSS}
    Input Text                          id=last-name            ${LastNameXSS}
    Input Text                          id=postal-code          ${ZipCodeXSS}
    Sleep    1s


    Click Button                        xpath=//*[@id="continue"]
    Sleep    1s
    Log To Console                      "Step 'Incluir Dados de Postagem unahppy' worked"
    Sleep   20s

Verificar resumo da compra unhappy
    Verificar resumo da compra

Concluir compra unhappy
    Concluir compra

Fechar o Navegador unahppy
    Close Browser
    Log To Console                       "Step 'Fechar o Navegador - unhappy' worked"
