*** Settings ***

Documentation           Aqui estarão presentes todas as keywords / ações que
...                     compoem os testes de automação web.


Library                 SeleniumLibrary
Library                 String
Library                 Process
Library                 XML
Library                 FakerLibrary


*** Variable ***

${Browser}              firefox
${URL}                  https://www.orbia.ag/
${CellPhone}            16991565721
${email}                kellen.belotto@gmail.com
${pwd}                  Test123#
${token3}               3
${token4}               4
${token5}               5
${mensagem_esperada}    "Código inválido ou expirado. Por favor, tente novamente."
${FILE}                 C:\GIT\robot-challenge\files\test.csv

*** Keywords ***
Dado que eu quero cotar insumos
  Open Browser                        url=${URL}                                                  browser=${Browser}
  Maximize Browser Window
  Click Element                       xpath=//*[@id="menu-main-navigation"]/li[4]/a
  Wait Until Element Is Enabled       id=btnComecarCotacao
  Click Element                       id=btnComecarCotacao

E eu tenho Orbia login valido
  Input Text                          xpath=//*[@id="loginEmail"]                                 ${email}        
  Input Text                          xpath=//*[@id="password"]                                   ${pwd}
  Wait Until Element Is Enabled       xpath=//button[@id="login"]  
  Click Button                        xpath=//button[@id="login"]
  Sleep    2s

Quando eu preencher o formulario de cotacao 
  Wait Until Element Is Enabled               xpath=//select[@id="dropDownEstados"]    
  click Element                               xpath=//*[@id="dropDownEstados"]/option[contains(text(),"AC")] 
  click Element                               xpath=//select[@id="dropDownCidades"]
  click element                               xpath=//*[@id="dropDownCidades"]/option[contains(text(),"Assis Brasil")]  
  click element                               xpath=//select[@id="dropDownPrazoMaximoEntrega"]
  click element                               xpath=//*[@id="dropDownPrazoMaximoEntrega"]/option[contains(text(),"Março 2023")]
  Click Element                               xpath=//select[id="dropDownFormaDePagamento"]
  click element                               xpath=//*[@id="dropDownFormaDePagamento"]/option[contains(text(),"Boleto a prazo: 60 dias")]
  Select From List By Value                   xpath=//*[@id="dropDownFormaDePagamento"]/option[contains(text(),"Boleto a prazo: 60 dias")]
  Sleep    2s
  Click Element                               xpath=//div[@id="uploadFile"]     
  Choose File                                 xpath=//div[@id="uploadFile"]    ${FILE} 
  Wait Until Element Is Visible               xpath=//*[@id="file-0"]
  Sleep    2s
	
	
E clicar no botao Solicitar Cotacao  
  Click Button                                class="btn-solicitar-cotacao"
  Element Should Be Visible                   xpath=//*[@id="corpo"]      
  Page Should Contain                         Cotação solicitada com sucesso!  
Então uma mensagem de sucesso é exibida
  Element Should Be Visible                   xpath=//*[@id="btnAzul"]
  Should Be Equal                             id="btnAzul"                     Ok, entendi
  Click Button                                xpath=class="close"
  Close All Browsers