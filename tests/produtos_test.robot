#Sessão para configuração, documentacao, imports de arquivos e librarys
* Settings *

Documentation   Arquivos de teste para o endpoint de /produtos
Resource        ../keywords/login_keywords.robot
Resource        ../keywords/user_keywords.robot
Resource        ../keywords/produtos_keywords.robot


Suite Setup     Criar Sessao

#Sessão para criacao dos cenários de teste
* Test Cases *

#VALIDAÇÕES NO ENDPOINT /produtos

Cenario: POST Produto 201
    [Tags]  POST_PRODUTO
    Iniciar cores de resposta
    POST Login Valido Usando FUNCAO
    POST Cadastro Produto Estatico Valido
    Imprimir Produto Response.Content
    Resposta Produto Cadastrado 
    validar Status Code "201"
    DELETE Endpoint /produtos

Cenario: POST Produto Repetido 400
    [Tags]  POST_PRODUTREPETIDO
    Iniciar cores de resposta
    POST Login Valido Usando FUNCAO
    POST Cadastro Produto Estatico Repetido
    Imprimir Produto Response.Content
    Resposta Produto Repetido
    validar Status Code "400"

Cenario: POST Produto Token Invalido 401
    [Tags]  POST_PRODUTO_TOKEN_INVALIDO
    Iniciar cores de resposta
    POST Login Valido Usando FUNCAO
    POST Cadastro Produto Token Invalido
    Imprimir Produto Response.Content
    Resposta Produto Token Invalido
    validar Status Code "401"

Cenario: POST Produto Token Usuario Excluido 401
    [Tags]  POST_TOKEN_USUARIO_EXCLUIDO
    Iniciar cores de resposta
    POST Cadastro Usuario Estatico Valido
    POST Login Usuario Excluido
    DELETE Endpoint /usuarios
    POST Cadastro Produto Estatico Valido
    Imprimir Produto Response.Content
    Resposta Produto Cadastrado Usuario excluido
    validar Status Code "401"
    
Cenario: POST Produto ADM False 403
    [Tags]  POST_PRODUTO_ADM_FALSE
    Iniciar cores de resposta
    POST Cadastro Usuario Estatico ADM False
    POST Login Estatico Login Administrator False
    POST Cadastro Produto Estatico Valido
    Imprimir Produto Response.Content
    Resposta Produto Cadastrado Administrador False
    validar Status Code "403"
    DELETE Endpoint /usuarios

Cenario: GET Listar Produtos 200
    [tags]  GET_PRODUTOS
    Iniciar cores de resposta
    POST Login Valido Usando FUNCAO
    GET Endpoint /produtos
    validar Status Code "200"


Cenario: GET Listar Produto ID 200
    [Tags]  GET_PRODUTO_ID
    Iniciar cores de resposta
    POST Login Valido Usando FUNCAO
    GET Endpoint FUNCAO /produtos/_id
    validar Status Code "200"

Genario: GET Listar Produto ID Não Encontrado 400
    [Tags]    GET_PRODUTO_ID_NAO_ENCONTRADO
    Iniciar cores de resposta
    POST Login Valido Usando FUNCAO
    GET Endpoint Estatico /produto/_id Nao Encontrado
    Resposta Produto Não Encontrado
    validar Status Code "400"

Cenario; PUT Alterar Produto Cadastrado 200
    [Tags]  PUT_PRODUTO
    Iniciar cores de resposta
    POST Login Valido Usando FUNCAO
    POST Cadastro Produto Estatico Valido
    PUT Cadastro Produto Estatico Valido    
    Resposta Produto Alterado 
    validar Status Code "200"
    DELETE Endpoint /produtos

Cenario: PUT Alterar Produto Sem ID 201
    [Tags]  PUT_PRODUTO_SEM_ID
    Iniciar cores de resposta
    POST Login Valido Usando FUNCAO
    PUT Alterar Produto Estatico Valido Sem ID
    Resposta Produto Alterado Sem ID
    validar Status Code "201"
    DELETE Endpoint /produtos

Cenario: PUT Alterar Produto Nome Repetido 400
    [Tags]  PUT_PRODUTO_NOME_REPETIDO
    Iniciar cores de resposta
    POST Login Valido Usando FUNCAO
    POST Cadastro Produto Estatico Valido
    PUT Cadastro Produto Estacico Nome Repetid0
    Resposta Produto Nome Repetido
    validar Status Code "400"
    DELETE Endpoint /produtos
Cenario: PUT Alterar Produto Token Invalido 401
    [Tags]  PUT_PRODUTO_TOKEN_INVALIDO
    Iniciar cores de resposta
    POST Login Valido Usando FUNCAO 
    PUT Alteracao Produto Token Invalido
    Resposta Produto Token Invalido
    validar Status Code "401"

Cenario: PUT Alterar Produto Token Usuario Excluido 401
    [Tags]  PUT_PRODUTO_TOKEN_USUARIO_EXCLUIDO
    Iniciar cores de resposta
    POST Cadastro Usuario Estatico Valido
    POST Login Usuario Excluido
    DELETE Endpoint /usuarios
    PUT Alterar Produto Estatico Valido Sem ID
    Resposta Produto Cadastrado Usuario excluido
    validar Status Code "401"

Cenario: PUT Alterar Produto ADM False 403
    [Tags]  PUT_PRODUTO_ADM_FALSE
    Iniciar cores de resposta
    POST Cadastro Usuario Estatico ADM False
    POST Login Estatico Login Administrator False
    PUT Alterar Produto Estatico Valido Sem ID
    Resposta Produto Cadastrado Administrador False
    validar Status Code "403"
    DELETE Endpoint /usuarios

Cenario: DELETE Produto Cadastrado 200
    [Tags]  DELETE_PRODUTO
    Iniciar cores de resposta
    POST Login Valido Usando FUNCAO
    POST Cadastro Produto Estatico Valido
    DELETE Endpoint /produtos
    Imprimir Delete Produto Response.Content
    Resposta Produto Excluido
    validar Status Code "200"

Cenario: DELETE Excluir Produto ID Inexistente 200
    [Tags]    DELETE_PRODUTO_ID_INEXISTENTE
    Iniciar cores de resposta
    POST Login Valido Usando FUNCAO
    DELETE Endpoint /produtos Nao Encontrado
    Imprimir Delete Produto Response.Content
    Resposta Delete Produto ID inexistente
    validar Status Code "200"

Cenario: DELETE Excluir Produto Carrinho Cadastrado 400
    [Tags]  DELETE_PRODUTO_CARRINHO_CADASTRADO
    Iniciar cores de resposta
    POST Login Valido Usando FUNCAO
    DELETE Endpoint /produtos Carrinho Cadastrado
    Imprimir Delete Produto Response.Content
    Resposta Produto Excluido Carrinho Cadastrado
    validar Status Code "400"

Cenario: DELETE Excluiar Produto Token Invalido 401
    [Tags]  DELETE_PRODUTO_TOKEN_INVALIDO
    Iniciar cores de resposta
    POST Login Valido Usando FUNCAO
    DELETE Endpoint /produtos Token Invalido
    Imprimir Delete Produto Response.Content
    Resposta Produto Token Invalido
    validar Status Code "401"

Cenario: DELETE Token Usuario Excluido 401
    [Tags]  DELETE_PRODUTO_TOKE_USUARIO_EXCLUIDO
    Iniciar cores de resposta
    POST Cadastro Usuario Estatico Valido
    POST Login Usuario Excluido
    DELETE Endpoint /usuarios
    DELETE Endpoint /produtos Carrinho Cadastrado
    Imprimir Delete Produto Response.Content
    Resposta Produto Cadastrado Usuario excluido
    validar Status Code "401"

Cenario: DELETE Produto ADM False 403
    [Tags]  DELETE_PRODUTO_ADM_FALSE
    Iniciar cores de resposta
    POST Cadastro Usuario Estatico ADM False
    POST Login Estatico Login Administrator False
    DELETE Endpoint /produtos Nao Encontrado
    Imprimir Delete Produto Response.Content
    Resposta delete produto adm false
    validar Status Code "403"
    DELETE Endpoint /usuarios







