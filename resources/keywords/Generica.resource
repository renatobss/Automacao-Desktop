*** Settings ***
Library    SikuliLibrary
Resource   Controle.resource
Resource   Keyboard.resource
Resource   Wait.resource
Resource   Mouse.resource

*** Keywords ***
Limpar Campo De Pesquisa
    [Arguments]    ${imagem}
    [Documentation]    Limpa o campo de pesquisa
    Aguardar Imagem Aparecer    ${imagem}    10
    Clicar Na Imagem            ${imagem}
    Sleep    1s
    Pressionar Tecla            {HOME}
    Pressionar Tecla            +{END}
    Pressionar Tecla            {BACKSPACE}

Limpar Campo De Texto
    [Documentation]    Limpa o campo de texto
    Pressionar Tecla    {BACKSPACE}

