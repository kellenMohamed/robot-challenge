*** Settings ***
Documentation    Test Compras Web Sauce Demo
Resource         ../resources/keywords/resource-cadastro-agro.robot

*** Test Cases ***
Caso de Teste 01: Cadastro Agropecuarista com token invalido
    Cadastrar Pessoa


