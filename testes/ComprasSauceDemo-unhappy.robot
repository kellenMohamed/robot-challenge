*** Settings ***
Documentation    Test Compras Web Sauce Demo
Resource         ../resources/keywords/resource-unhappy.robot

*** Test Cases ***
Caso de Teste 01: Validar invalido valor no campo Name
    Abrir pagina unahppy
    Realizar o Login unahppy
    Visualizar o produto "Sauce Labs Backpack" e seu valor unahppy
    Adicionar Itens ao carrinho unahppy
    Remover os produtos unahppy
    Verificar carrinho unahppy
    Incluir Dados de Postagem unahppy
    Fechar o Navegador unahppy