*** Settings ***

Documentation           Aqui estarão presentes todas as keywords / ações que
...                     compoem os testes de automação web.


Library                 SeleniumLibrary
Library                 String
Library                 Process
Library                 XML
Library                 FakerLibrary


*** Variable ***

${Browser}              chrome
${URL}                  https://www.orbia.ag/
${CellPhone}            16991565721
${token1}               1
${token2}               2
${token3}               3
${token4}               4
${token5}               5
${mensagem_esperada}    "Código inválido ou expirado. Por favor, tente novamente."

*** Keywords ***

### Setup e Teardown

*** Settings ***

*** Keywords ***
Cadastrar Pessoa
  Open Browser                        url=${URL}      browser=${Browser}
  Maximize Browser Window
  Wait Until Element Is Visible       xpath=/html/body/div[1]/div[1]/div[1]/div[2]/div/div[1]/div[1]/a/img

  # Save Fake data for next tests:
  ${NOMEFAKE}                 FakerLibrary.Name
  ${ENDERECOFAKE}             FakerLibrary.Address
  ${TELEFONEFAKE}             FakerLibrary.Phone Number
  ${CIDADEFAKE}               FakerLibrary.City
  ${CODIGOPOSTALFAKE}         FakerLibrary.Postalcode
  ${TRABALHOFAKE}             FakerLibrary.Job
  @{PESSOA}                   Create List    Nome Aleatório: ${NOMEFAKE}  Endereço Aleatório: ${ENDERECOFAKE}
  ...                         Telefone Aleatório: ${TELEFONEFAKE}  Cidade Aleatória: ${CIDADEFAKE}
  ...                         CódigoPostal Aleatório: ${CODIGOPOSTALFAKE}   Trabalho: ${TRABALHOFAKE}
  Log Many                    @{PESSOA}
  
  # Steps that don't need from Fake data
  Click Element                   xpath=//*[@id="userMenuItem"]/a/span/small
  Element Should Be Visible       xpath= //*[@id="cell"]     
  Input Text                      xpath=//*[@id="cell"]        ${CellPhone}
  Click Element                   id=continueRegisterCell
  Wait Until Element Is Visible   xpath=//*[@id="btnModalMFAExplicaFechar"] 
  Click Element                   xpath=//*[@id="btnModalMFAExplicaFechar"]
  Wait Until Element Is Visible    //*[@id="token1"]  
  Wait Until Element Is Visible    //*[@id="token2"]   
  Wait Until Element Is Visible    //*[@id="token3"]   
  Wait Until Element Is Visible    //*[@id="token4"]   
  Wait Until Element Is Visible    //*[@id="token5"]     
  Input Text    //*[@id="token1"]   ${token1} 
  Input Text    //*[@id="token2"]   ${token2} 
  Input Text    //*[@id="token3"]   ${token3} 
  Input Text    //*[@id="token4"]   ${token4} 
  Input Text    //*[@id="token5"]   ${token5} 
  Sleep    20s
  
Fechar o Navegador
    Close Browser
    Log To Console                   "Step 'Fechar o Navegador - Compra concluida' worked"