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
    Aguardar Imagem Aparecer    ${IMAGENS_LOGIN}/botao-selecionar.png    30
    Clicar Na Imagem    ${IMAGENS_LOGIN}/botao-selecionar.png
    Clicar Na Imagem    ${IMAGENS_LOGIN}/ok.png
    Aguardar Imagem Aparecer    ${IMAGENS_LOGIN}/mensagem-ok.png    30
    Clicar Na Imagem    ${IMAGENS_LOGIN}/mensagem-ok.png

Efetuar Login Completo
    [Documentation]    Fluxo completo: abrir sistema + login + selecionar turno
    [Arguments]    ${usuario}    ${senha}
    Abrir Sistema
    Aguardar Janela Ativa
    Clicar Em Continuar Servidor
    Fazer Login    ${usuario}    ${senha}
    Selecionar Turno