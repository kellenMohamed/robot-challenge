*** Settings ***
Documentation    Test Compras Web Sauce Demo
Resource         ../resources/keywords/resource.robot

*** Test Cases ***
Caso de Teste 01: Login na pagina Sauce Demo e realizar uma Compras
    Abrir pagina
    Realizar o Login
    Visualizar o produto "Sauce Labs Backpack" e seu valor
    Ordenar os produtos nas 4 opcoes de ordenacao
    Adicionar Itens ao carrinho
    Remover os produtos
    Verificar carrinho
    Incluir Dados de Postagem
    Verificar resumo da compra
    Concluir compra
    Fechar o Navegador

    
Caso de Teste 02: Validar Cor na pagina de login  
    Abrir pagina
    Validar Cor