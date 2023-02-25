*** Settings ***

Documentation           Aqui estarão presentes todas as keywords / ações que
...                     compoem os testes de automação web.


Library                 SeleniumLibrary
Library                 String
Library    Process
Library    XML


*** Variable ***

${Browser}          chrome
${URL}              https://www.saucedemo.com/
${user}             standard_user
${psw}              secret_sauce
${valor}            $29.99
${FirstName}        Test Kellen
${LastName}         Last Name
${ZipCode}          01310-916  

*** Keywords ***

### Setup e Teardown

Validar Cor
    Get Element Attribute    xpath=//*[@id="login-button"]    background-color:#e2231a 
    
Abrir pagina
    Open Browser                        url=${URL}      browser=${Browser}
    Maximize Browser Window
    Wait Until Element Is Visible       xpath=//*[@id="root"]/div/div[1]
    Title Should Be                     Swag Labs
    Element Should Be Visible           xpath=//*[@id="login-button"]
    Log To Console                      "Step 'Abrir pagina' worked"
    Sleep    2s

Realizar o Login
    Input Text                          xpath=//*[@id="user-name"]        ${user}
    Sleep    1s
    Input Text                          xpath=//*[@id="password"]         ${psw}
    Sleep    1s
    Click Element                       xpath=//*[@id="login-button"]
    Sleep    1s
    Log To Console                      "Step 'Realizar o Login' worked"

Visualizar o produto "Sauce Labs Backpack" e seu valor
    Wait Until Element Is Visible       xpath=//*[//*[@id="item_4_title_link"]/div and contains(text(),'Sauce Labs Backpack')]
    Wait Until Element Is Enabled       xpath=//*[@id="item_4_title_link"]/div
    Element Should Be Visible           class=inventory_item_price    
    #Should Contain                      xpath=//*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div          ${valor}
    Log To Console                      "Step 'Visualizar os produtos' worked"
    Sleep    2s

Ordenar os produtos nas 4 opcoes de ordenacao
    Click Element                       xpath=//*[@id="header_container"]/div[2]/div[2]/span/select/option[1]
    Sleep    1s
    Click Element                       xpath=//*[@id="header_container"]/div[2]/div[2]/span/select/option[2]
    Sleep    1s
    Click Element                       xpath=//*[@id="header_container"]/div[2]/div[2]/span/select/option[3]
    Sleep    1s
    Click Element                       xpath=//*[@id="header_container"]/div[2]/div[2]/span/select/option[4]
    Log To Console                      "Step 'Ordenar os produtos nas 4 opcoes de ordenacao' worked"


Adicionar Itens ao carrinho
    Click Button                        xpath=//*[@id="add-to-cart-sauce-labs-backpack"]
    Click Button                        xpath=//*[@id="add-to-cart-sauce-labs-onesie"]
    Click Button                        xpath=//*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    Log To Console                      "Step 'Adicionar Itens ao carrinho' worked"
    Sleep    1s

Remover os produtos
    Click Element                       xpath=//*[@id="shopping_cart_container"]/a
    Sleep    1s
    Click Button                        xpath=//*[@id="remove-sauce-labs-backpack"]
    Log To Console                      "Step 'Remover os produtos' worked"
    Sleep    1s

Verificar carrinho
    Element Should Be Visible           xpath=//*[@id="cart_contents_container"]/div/div[1]/div[1]
    Element Should Contain              xpath=//*[@id="cart_contents_container"]/div/div[1]/div[2]   DESCRIPTION
    Page Should Contain Button          xpath=//*[@id="continue-shopping"]
    Click Button                        xpath=//*[@id="checkout"]
    Log To Console                      "Step 'Verificar carrinho' worked"
    Sleep    1s

Incluir Dados de Postagem
    Input Text                          id=first-name           ${FirstName}
    Sleep    1s
    Input Text                          id=last-name            ${LastName}
    Sleep    1s
    Input Text                          id=postal-code          ${ZipCode}
    Click Button                        xpath=//*[@id="continue"]
    Sleep    1s
    Log To Console                      "Step 'Incluir Dados de Postagem' worked"

Verificar resumo da compra
    Element Should Be Visible           xpath=//*[@id="header_container"]/div[2]/span
    Page Should Contain                 Payment Information:
    Page Should Contain                 Shipping Information:
    Page Should Contain                 Item total: $
    Page Should Contain                 Tax: $
    Page Should Contain Button          id=cancel    
    Sleep    2s
    Log To Console                      "Step 'Verificar resumo da compra' worked"

Concluir compra
    Click Button                        id=finish  
    Sleep    2s
    Page Should Contain Element         class=header_secondary_container
    Log To Console                      "Step 'Concluir compra' worked"

Fechar o Navegador
    Close Browser
    Log To Console                       "Step 'Fechar o Navegador - COmpra concluida' worked"