*** Settings ***
Resource    ../Base.resource

*** Keywords ***
Clicar Em Continuar Servidor
    Clicar Na Imagem    ${IMAGENS_LOGIN}/continuar-sel-servidor.png

Fazer Login
    [Arguments]    ${usuario}    ${senha}
    Aguardar Imagem Aparecer    ${IMAGENS_LOGIN}/campo-usuario.png    30
    Digitar No Campo    ${IMAGENS_LOGIN}/campo-usuario.png    ${usuario}
    Pressionar Tecla    {TAB}
    Digitar No Campo    ${IMAGENS_LOGIN}/campo-senha.png    ${senha}
    Clicar Na Imagem    ${IMAGENS_LOGIN}/botao-entrar.png

Selecionar Turno
    [Arguments]    ${turno}
    IF    '${turno}' == '0'
        Aguardar Imagem Aparecer    ${IMAGENS_LOGIN}/botao-selecionar.png    30
        Clicar Na Imagem    ${IMAGENS_LOGIN}/botao-selecionar.png
        Clicar Na Imagem    ${IMAGENS_LOGIN}/ok.png
        Aguardar Imagem Aparecer    ${IMAGENS_LOGIN}/mensagem-ok.png    30
        Clicar Na Imagem    ${IMAGENS_LOGIN}/mensagem-ok.png
    ELSE 
        ${data_hoje}    Get Current Date    format=%d/%m/%Y
    END

Efetuar Login Completo
    [Documentation]    Fluxo completo: login + selecionar turno (sistema deve estar aberto)
    [Arguments]    ${usuario}    ${senha}
    Aguardar Janela Ativa
    Clicar Em Continuar Servidor
    Fazer Login    ${usuario}    ${senha}
    Selecionar Turno