*** Settings ***
Resource    ../Base.resource

*** Keywords ***
Abrir Gerenciamento de Cidades
    [Documentation]    Abre o gerenciamento de cidades
    Aguardar Janela Ativa
    Aguardar Imagem Aparecer    ${IMAGENS_CIDADE}/menu-utilitarios.png    10
    Navegar Por Imagem          ${IMAGENS_CIDADE}/menu-utilitarios.png
    Aguardar Imagem Aparecer    ${IMAGENS_CIDADE}/gerenciamento-cidades.png    10
    Navegar Por Imagem          ${IMAGENS_CIDADE}/gerenciamento-cidades.png