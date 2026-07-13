*** Settings ***
Library    SikuliLibrary
Resource   Controle.resource

*** Keywords ***
Digitar No Campo
    [Documentation]    Clica na imagem do campo e digita o valor
    [Arguments]    ${imagem}    ${valor}
    SikuliLibrary.Input Text    ${imagem}    ${valor}

Pressionar Tecla
    [Arguments]    ${tecla}
    Enviar Teclas    ${tecla}

Pressionar Tecla Multiplas Vezes
    [Arguments]    ${tecla}    ${vezes}
    Repeat Keyword    ${vezes} times    Pressionar Tecla    ${tecla}