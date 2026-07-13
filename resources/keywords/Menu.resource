*** Settings ***
Resource    Mouse.resource
Resource    Wait.resource

*** Keywords ***
Navegar Por Imagem
    [Documentation]    Espera o item de menu aparecer e clica nele — usado em qualquer navegação de menu do ERP
    [Arguments]    ${imagem}    ${timeout}=30
    Aguardar Imagem Aparecer    ${imagem}    ${timeout}
    Clicar Na Imagem    ${imagem}