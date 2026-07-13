*** Settings ***
Library    SikuliLibrary

*** Keywords ***
Clicar Na Imagem
    [Documentation]    Clica em um elemento identificado por imagem
    [Arguments]    ${imagem}
    SikuliLibrary.Click    ${imagem}

Duplo Clique Na Imagem
    [Arguments]    ${imagem}
    SikuliLibrary.Double Click    ${imagem}