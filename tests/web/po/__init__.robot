*** Settings ***
Resource    ../../../pages/base_page.robot
Suite Setup    Obter Data e hora
Test Setup    base_page.Abrir navegador
Test Teardown    base_page.Fechar navegador