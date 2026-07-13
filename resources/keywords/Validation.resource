*** Settings ***
Library    SikuliLibrary

*** Keywords ***
Validar Imagem Presente
    [Documentation]    Falha o teste com mensagem clara se a imagem não estiver na tela
    [Arguments]    ${imagem}    ${mensagem}=Elemento esperado não encontrado na tela
    ${existe}=    Run Keyword And Return Status    Screen Should Contain    ${imagem}
    Run Keyword If    not ${existe}    Fail    ${mensagem}: ${imagem}