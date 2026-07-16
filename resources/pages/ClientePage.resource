*** Settings ***
Resource    ../Base.resource

*** Keywords ***
Abrir Cadastro de Cliente
    [Documentation]    Abre a tela de cadastro de cliente
    Aguardar Janela Ativa
    Navegar Por Imagem    ${IMAGENS_CLIENTE}/menu-clientes.png
    Sleep    1s
    Navegar Por Imagem    ${IMAGENS_CLIENTE}/gerenciamento-entidades.png
    Sleep    1s
    Navegar Por Imagem    ${IMAGENS_CLIENTE}/botao-novo.png

Preencher Dados do Cliente
    [Arguments]    ${cpf}      ${nome}
    [Documentation]    Preenche os dados do cliente no formulário de cadastro
    Pressionar Tecla Multiplas Vezes    {TAB}    3
    Pressionar Tecla    ${cpf}
    Pressionar Tecla Multiplas Vezes    {TAB}    2
    Pressionar Tecla    ${nome}
    Pressionar Tecla Multiplas Vezes    {TAB}    12
    Buscar Cidade    Pato Branco
    Pressionar Tecla    {TAB}

Buscar Cidade
    [Arguments]    ${nome_cidade}
    [Documentation]    Busca a cidade no campo de busca do formulário de cadastro
    Clicar Na Imagem    ${IMAGENS_CLIENTE}/buscar-cidade.png
    Pressionar Tecla    ${nome_cidade}
    Pressionar Tecla    {ENTER}

Salvar Cliente
    [Documentation]    Salva o cadastro do cliente
    Clicar Na Imagem    ${IMAGENS_CLIENTE}/botao-salvar.png

Deletar Cliente
    [Arguments]    ${nome}
    [Documentation]    Deleta o cadastro do cliente
    Clicar Na Imagem    ${IMAGENS_CLIENTE}/pesquisar-cliente.png
    Pressionar Tecla    ${nome}
    Clicar Na Imagem    ${IMAGENS_CLIENTE}/botao-deletar.png
    Sleep    1s
    Pressionar Tecla    %s
    Sleep    1s
    Limpar Campo de Pesquisa
    Sleep    1s

Limpar Campo de Pesquisa
    [Documentation]    Limpa o campo de pesquisa do gerenciamento de entidades
    Clicar Na Imagem    ${IMAGENS_CLIENTE}/pesquisar-cliente.png
    Pressionar Tecla    +{HOME}
    Pressionar Tecla    {BACKSPACE}

Fechar Gerenciamento de Entidades
    [Documentation]    Fecha a tela de gerenciamento de entidades
    Clicar Na Imagem    ${IMAGENS_CLIENTE}/botao-fechar.png