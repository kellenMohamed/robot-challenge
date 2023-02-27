*** Settings ***
Documentation    Test Compras Web Sauce Demo
Resource         ../resources/keywords/resource-cotar-insumos.robot

*** Test Cases ***
Caso de Teste 01: Cota Insumos com usuario pre-criado
     Dado que eu quero cotar insumos
        E eu tenho Orbia login valido
   Quando eu preencher o formulario de cotacao
        E clicar no botao Solicitar Cotacao
    Então uma mensagem de sucesso é exibida


