*** Settings ***
# chamar da base page
Resource    ../../../pages/base_page.robot

*** Test Cases ***
Selecionar Mochila
    Tirar Screenshot    1- Home
    Preencher Usuario    standard_user
    Preencher Senha    secret_sauce
    Tirar Screenshot    2- Login Preenchido
    Clicar no botao login
    # Checar o elemento, no teste e nunca nas pages
    Element Text Should Be    ${titulo_secao}    Products
    Tirar Screenshot    3- Lista de Produto
    Clicar no Produto    Sauce Labs Backpack
    Element Text Should Be    ${inventory_item_product_name}    Sauce Labs Backpack
    Element Text Should Be    ${inventory_item_product_price}    $29.99
    Tirar Screenshot    4- Detalhes do Produto
    Clicar no botao "Add to cart"    
    Clicar no Carrinho
    Element Text Should Be    ${titulo_secao}    Your Cart
    Element Text Should Be    ${cart_product_name}    Sauce Labs Backpack
    Element Text Should Be    ${cart_product_price}    $29.99
    Element Text Should Be    ${cart_product_quantidade}    1
    Tirar Screenshot    5- Carrinho
    Realizar Logout
