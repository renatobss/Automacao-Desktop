*** Settings ***
Resource    ../Base.resource

*** Keywords ***
Abrir Gerenciamento de Entidades
    [Documentation]    Abre o gerenciamento de entidades
    Aguardar Janela Ativa
    Aguardar Imagem Aparecer    ${IMAGENS_CLIENTE}/menu-clientes.png    10
    Navegar Por Imagem          ${IMAGENS_CLIENTE}/menu-clientes.png
    Aguardar Imagem Aparecer    ${IMAGENS_CLIENTE}/gerenciamento-entidades.png    10
    Navegar Por Imagem          ${IMAGENS_CLIENTE}/gerenciamento-entidades.png

Abrir Cadastro de Cliente
    [Documentation]    Abre o cadastro de cliente
    Aguardar Imagem Aparecer    ${IMAGENS_COMUM}/botao-novo.png    10
    Navegar Por Imagem          ${IMAGENS_COMUM}/botao-novo.png

Preencher Dados do Cliente - Aba Principal
    [Arguments]    ${cpf}      ${nome}      ${cep}      ${endereco}      ${numero}      ${bairro}
    [Documentation]    Preenche os dados do cliente no formulário de cadastro - Aba Principal
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
    Pressionar Tecla    ${cep}
    Pressionar Tecla    {TAB}
    Pressionar Tecla    {TAB}
    Pressionar Tecla    ${endereco}
    Pressionar Tecla    {TAB}
    Pressionar Tecla    ${numero}
    Pressionar Tecla    {TAB}
    Pressionar Tecla    ${bairro}
    Pressionar Tecla    {TAB}
    Buscar Cidade    Pato Branco
    Pressionar Tecla    {TAB}

Preencher Dados do Cliente - Aba Financeiro
    [Documentation]    Preenche os dados do cliente no formulário de cadastro - Aba Financeiro
    Clicar Na Imagem            ${IMAGENS_CLIENTE}/aba-financeiro.png
    Aguardar Imagem Aparecer    ${IMAGENS_CLIENTE}/aba-pagamentos.png    10
    Pressionar Tecla            {TAB}
    Pressionar Tecla            {TAB}
    Pressionar Tecla            " "    # À Prazo
    Pressionar Tecla            {TAB}
    Aguardar Imagem Aparecer    ${IMAGENS_CLIENTE}/combobox-forma-padrao.png    10
    Clicar Na Imagem            ${IMAGENS_CLIENTE}/combobox-forma-padrao.png
    Clicar Na Imagem            ${IMAGENS_CLIENTE}/forma-pgto-padrao-dinheiro.png

Buscar Cidade
    [Arguments]    ${nome_cidade}
    [Documentation]    Busca a cidade no campo de busca do formulário de cadastro
    Clicar Na Imagem    ${IMAGENS_COMUM}/buscar-cidade.png
    Pressionar Tecla    ${nome_cidade}
    Pressionar Tecla    {ENTER}

Salvar Cliente
    [Documentation]    Salva o cadastro do cliente
    Aguardar Imagem Aparecer    ${IMAGENS_COMUM}/botao-salvar.png    10
    Clicar Na Imagem            ${IMAGENS_COMUM}/botao-salvar.png
    Wait Until Keyword Succeeds    10s    0.5s    Botao Salvar Desapareceu    ${IMAGENS_COMUM}/botao-salvar.png    

Deletar Cliente
    [Documentation]    Deleta o cadastro do cliente
    ${existe_antes}=    Run Keyword And Return Status    Screen Should Contain    ${IMAGENS_CLIENTE}/cliente-deletado.png
    Log To Console    Registro existe antes da deleção: ${existe_antes}
    Run Keyword If    not ${existe_antes}    Fail    Registro não encontrado na grid antes da deleção
    Aguardar Imagem Aparecer    ${IMAGENS_COMUM}/botao-deletar.png    10
    Clicar Na Imagem            ${IMAGENS_COMUM}/botao-deletar.png
    Pressionar Tecla            %s
    Aguardar Imagem Desaparecer    ${IMAGENS_CLIENTE}/cliente-deletado.png    20
    Limpar Campo De Pesquisa        ${IMAGENS_CLIENTE}/pesquisar-cliente.png
    

Editar Cadastro do Cliente   
    [Documentation]    Abre o cadastro de cliente para edição
    Aguardar Imagem Aparecer    ${IMAGENS_COMUM}/botao-editar.png    10
    Clicar Na Imagem            ${IMAGENS_COMUM}/botao-editar.png

Alterar Cadastro do Cliente - Aba Principal
    [Arguments]    ${cpf}      ${nome}
    [Documentation]    Edita os dados do cliente no formulário de cadastro - Aba Principal
    Pressionar Tecla            {TAB}
    Pressionar Tecla            {TAB}
    Pressionar Tecla            {TAB}
    Limpar Campo de Texto
    Pressionar Tecla            ${cpf}
    Pressionar Tecla            {TAB}
    Pressionar Tecla            {TAB}
    Limpar Campo de Texto
    Pressionar Tecla            ${nome}
    Pressionar Tecla            {TAB}

Pesquisar Cliente
    [Arguments]    ${nome}
    [Documentation]    Pesquisa o cliente no gerenciamento de entidades
    Aguardar Imagem Aparecer    ${IMAGENS_CLIENTE}/pesquisar-cliente.png    10
    Clicar Na Imagem            ${IMAGENS_CLIENTE}/pesquisar-cliente.png
    Pressionar Tecla            ${nome}

Fechar Gerenciamento de Entidades
    [Documentation]    Fecha a tela de gerenciamento de entidades
    Aguardar Imagem Aparecer    ${IMAGENS_COMUM}/botao-fechar.png    10
    Clicar Na Imagem            ${IMAGENS_COMUM}/botao-fechar.png
