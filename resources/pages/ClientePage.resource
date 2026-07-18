*** Settings ***
Resource    ../Base.resource

*** Keywords ***
Abrir Gerenciamento de Entidades
    [Documentation]    Abre o gerenciamento de entidades
    Aguardar Janela Ativa
    Aguardar Imagem Aparecer    ${IMAGENS_CLIENTE}/menu-clientes.png    10
    Navegar Por Imagem    ${IMAGENS_CLIENTE}/menu-clientes.png
    Aguardar Imagem Aparecer    ${IMAGENS_CLIENTE}/gerenciamento-entidades.png    10
    Navegar Por Imagem    ${IMAGENS_CLIENTE}/gerenciamento-entidades.png

Abrir Cadastro de Cliente
    [Documentation]    Abre o cadastro de cliente
    Aguardar Imagem Aparecer    ${IMAGENS_COMUM}/botao-novo.png    10
    Navegar Por Imagem    ${IMAGENS_COMUM}/botao-novo.png

Preencher Dados do Cliente
    [Arguments]    ${cpf}      ${nome}
    [Documentation]    Preenche os dados do cliente no formulário de cadastro
    Pressionar Tecla    {TAB}
    Pressionar Tecla    {TAB}
    Pressionar Tecla    {TAB}
    Pressionar Tecla    ${cpf}
    Pressionar Tecla    {TAB}
    Pressionar Tecla    {TAB}
    Pressionar Tecla    ${nome}
    Pressionar Tecla    {TAB}
    Pressionar Tecla    {TAB}
    Pressionar Tecla    {TAB}
    Pressionar Tecla    {TAB}
    Pressionar Tecla    {TAB}
    Pressionar Tecla    {TAB}
    Pressionar Tecla    {TAB}
    Pressionar Tecla    {TAB}
    Pressionar Tecla    {TAB}
    Pressionar Tecla    {TAB}
    Pressionar Tecla    {TAB}
    Pressionar Tecla    {TAB}
    Buscar Cidade    Pato Branco
    Pressionar Tecla    {TAB}

Buscar Cidade
    [Arguments]    ${nome_cidade}
    [Documentation]    Busca a cidade no campo de busca do formulário de cadastro
    Clicar Na Imagem    ${IMAGENS_COMUM}/buscar-cidade.png
    Pressionar Tecla    ${nome_cidade}
    Pressionar Tecla    {ENTER}

Salvar Cliente
    [Documentation]    Salva o cadastro do cliente
    Aguardar Imagem Aparecer    ${IMAGENS_COMUM}/botao-salvar.png    10
    Clicar Na Imagem    ${IMAGENS_COMUM}/botao-salvar.png
    Wait Until Keyword Succeeds    10s    0.5s    Botao Salvar Desapareceu    ${IMAGENS_COMUM}/botao-salvar.png    

Deletar Cliente
    [Documentation]    Deleta o cadastro do cliente
    Aguardar Imagem Aparecer    ${IMAGENS_COMUM}/botao-deletar.png    10
    Clicar Na Imagem    ${IMAGENS_COMUM}/botao-deletar.png
    Pressionar Tecla    %s

Editar Cliente
    [Documentation]    Edita o cadastro do cliente
    Aguardar Imagem Aparecer    ${IMAGENS_COMUM}/botao-editar.png    10
    Clicar Na Imagem    ${IMAGENS_COMUM}/botao-editar.png

Pesquisar Cliente
    [Arguments]    ${nome}
    [Documentation]    Pesquisa o cliente no gerenciamento de entidades
    Aguardar Imagem Aparecer    ${IMAGENS_CLIENTE}/pesquisar-cliente.png    10
    Clicar Na Imagem    ${IMAGENS_CLIENTE}/pesquisar-cliente.png
    Pressionar Tecla    ${nome}

Limpar Campo de Pesquisa
    [Documentation]    Limpa o campo de pesquisa do gerenciamento de entidades
    Aguardar Imagem Aparecer    ${IMAGENS_CLIENTE}/pesquisar-cliente.png    10
    Clicar Na Imagem    ${IMAGENS_CLIENTE}/pesquisar-cliente.png
    Pressionar Tecla    +{HOME}
    Pressionar Tecla    {BACKSPACE}

Fechar Gerenciamento de Entidades
    [Documentation]    Fecha a tela de gerenciamento de entidades
    Aguardar Imagem Aparecer    ${IMAGENS_COMUM}/botao-fechar.png    10
    Clicar Na Imagem    ${IMAGENS_COMUM}/botao-fechar.png