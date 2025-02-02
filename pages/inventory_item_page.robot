*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${inventory_item_product_name}        css=div.inventory_details_name.large_size
${inventory_item_product_price}       css=div.inventory_details_price        
${btn_add_to_cart}    css=button.btn.btn_primary.btn_small.btn_inventory
*** Keywords ***
Clicar no botao "Add to cart"
    Click Button    ${btn_add_to_cart}
    