*** Settings ***
Documentation    Test Compras Web Sauce Demo
Resource         ../resources/keywords/resource-login-unhappy.robot

*** Test Cases ***
Caso de Teste 02: Validar user e psw invalidos
    Abrir pagina unahppy
    Realizar o Login user e psw invalidos unhappy
    Fechar o Navegador unahppy    
    
Caso de Teste 03: Validar user invalido
    Abrir pagina unahppy
    Realizar o Login user invalido unhappy
    Fechar o Navegador unahppy    

Caso de Teste 04: Validar pws invalido
    Abrir pagina unahppy
    Realizar o Login pws invalido unhappy
    Fechar o Navegador unahppy    
    