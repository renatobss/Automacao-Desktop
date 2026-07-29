*** Settings ***
Library    SikuliLibrary
Resource   Controle.resource

*** Keywords ***
Aguardar Imagem Aparecer
    [Documentation]    Espera uma imagem aparecer na tela, com timeout configurável
    [Arguments]    ${imagem}    ${timeout}=30
    Wait Until Screen Contain    ${imagem}    ${timeout}

Aguardar Imagem Desaparecer
    [Documentation]    Espera uma imagem desaparecer na tela, com timeout configurável
    [Arguments]    ${imagem}    ${timeout}=30
    Wait Until Screen Not Contain    ${imagem}    ${timeout}

Aguardar Janela Ativa
    Wait Until Keyword Succeeds    30s    2s    Ativar Janela