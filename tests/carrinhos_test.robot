#Sessão para configuração, documentacao, imports de arquivos e librarys
* Settings *

Documentation   Arquivos de teste para o endpoint de /carrinhos
Resource        ../keywords/login_keywords.robot
Resource        ../keywords/user_keywords.robot
Resource        ../keywords/produtos_keywords.robot
Resource        ../keywords/carrinhos_keywords.robot

Suite Setup     Criar Sessao

#Sessão para criacao dos cenários de teste
* Test Cases *

#VALIDAÇÕES NO ENDPOINT /carrinhos

Cenario: POST Carrinho 201
    [Tags]  POST_CARRINHO
    Iniciar cores de resposta
    POST Login Valido Usando FUNCAO
    POST Cadastro Carrinho Estatico Valido
    Imprimir Carrinho Response.Content
    Resposta Carrinho Cadastrado
    validar Status Code "201"
    DELETE Endpoint /carrinhos Cancelar Compra
    Imprimir Delete Carrinhos Response.Content

Cenario: POST Carrinho Produto Duplicado 400
    [Tags]  POST_CARRINHO_PRODUTO_DUPLICADO
    Iniciar cores de resposta
    POST Login Valido Usando FUNCAO
    POST Cadastro Carrinho Produto Repetido
    Imprimir Carrinho Response.Content
    Resposta Carrinho Produto Duplicado
    validar Status Code "400"

Cenario: POST Carrinho Carrinho Já Cadastrado 400
    [Tags]  POST_CARRINHO_DUPLICIDADE
    Iniciar cores de resposta
    POST Login Valido Usando FUNCAO
    POST Cadastro Carrinho Estatico Valido
    POST Cadastro Carrinho Estatico Valido
    Imprimir Carrinho Response.Content
    Reposta Um carrinho Por Cadastro
    validar Status Code "400"
    DELETE Endpoint /carrinhos Cancelar Compra
    
Cenario: POST Carrinho Produto Nao Encontrado 400
    [Tags]  POST_CARRINHO_PRODUTO_NAO_ENCONTRADO
    Iniciar cores de resposta
    POST Login Valido Usando FUNCAO
    POST Cadastro Carrinho Produto Nao Encontrado
    Imprimir Carrinho Response.Content
    Resposta Carrinho Produto Nao Encontrado
    validar Status Code "400"

Cenario: POST Carrinho Produto Insuficiente 400
    [Tags]  POST_CARRINHO_PRODUTO_INSUFICIENTE
    Iniciar cores de resposta
    POST Login Valido Usando FUNCAO
    POST Cadastro Carrinho Produto Insuficiente
    Imprimir Delete Carrinhos Response.Content
    Resposta Carrinho Produto Insuficiente
    validar Status Code "400"
    
Cenario: POST Carrinho Token Invalido 401
    [Tags]  POST_CARRINHO_TOKEN_INVALIDO
    Iniciar cores de resposta
    POST Login Valido Usando FUNCAO
    POST Cadastro Carrinho Token Invalido
    Imprimir Carrinho Response.Content
    Resposta Carrinho Token Invalido
    validar Status Code "401"

Cenario: POST Carrinho Token Usuario Excluido 401
    [Tags]  POST_TOKEN_USUARIO_EXCLUIDO
    Iniciar cores de resposta
    POST Cadastro Usuario Estatico Valido
    POST Login Usuario Excluido
    DELETE Endpoint /usuarios
    POST Cadastro Carrinho Estatico Valido
    Imprimir Carrinho Response.Content
    Resposta Carrinho Cadastrado Usuario excluido
    validar Status Code "401"

Cenario: GET Listar Carrinhos 200
    [Tags]  GET_LISTAR_CARRINHOS
    Iniciar cores de resposta
    POST Login Valido Usando FUNCAO
    GET Endpoint /carinhos
    validar Status Code "200"

Cenario: GET Listar Carrinho ID 200
    [Tags]  GET_PRODUTO_ID
    Iniciar cores de resposta
    POST Login Valido Usando FUNCAO
    GET Endpoint FUNCAO /carrinhos/_id
    validar Status Code "200"

Cenario: GET Listar Carrinho Sem ID 400
    [Tags]  GET_PRODUTO_SEM_ID
    Iniciar cores de resposta
    POST Login Valido Usando FUNCAO
    GET Endpoint Estatico /carrinhos/_id Nao Encontrado
    validar Status Code "400"
    
Cenario: DELETE Cancelar Compra 401
    [Tags]  DELETE_CANCELAR_COMPRA
    Iniciar cores de resposta
    POST Login Valido Usando FUNCAO
    POST Cadastro Carrinho Estatico Valido
    DELETE Endpoint /carrinhos Cancelar Compra
    Imprimir Delete Carrinhos Response.Content
    Resposta Compra Cancelada

Cenario: DELETE Cancelar Sem Carrinho Cadastrado 200
    [Tags]  DELETE_CANCELAR_COMPRA_CARRINHO_NAO_CADASTRADO
    Iniciar cores de resposta
    POST Login Valido Usando FUNCAO 
    DELETE Endpoint /carrinhos Cancelar Compra
    Imprimir Delete Carrinhos Response.Content
    Resposta Sem Carrinho Cadastrado 
    validar Status Code "200"

Cenario: DELETE Cancelar Token Invalido 401
    [Tags]  DELETE_CANCELAR_COMPRA_TOKEN_INVALIDO
    Iniciar cores de resposta
    POST Login Valido Usando FUNCAO
    DELETE Endpoint Cancelar Compra /carrinhos Token Invalido
    Imprimir Delete Carrinhos Response.Content
    Resposta Carrinho Token Invalido
    validar Status Code "401"

Cenario: DELETE Cancelar Token Usuario Excluido 401
    [Tags]  DELETE_COMPRA_TOKEN_USUARIO_EXCLUIDO
    Iniciar cores de resposta
    POST Cadastro Usuario Estatico Valido
    POST Login Usuario Excluido
    DELETE Endpoint /usuarios
    DELETE Endpoint /carrinhos Cancelar Compra
    Imprimir Delete Carrinhos Response.Content
    Resposta Carrinho Cadastrado Usuario excluido
    validar Status Code "401"

Cenario: DELETE Concluir Compra 200
    [Tags]  DELETE_CONCLUIR_COMPRA
    Iniciar cores de resposta
    POST Login Valido Usando FUNCAO
    POST Cadastro Carrinho Estatico Valido
    DELETE Endpoint /carrinhos Concluir Compra
    Imprimir Delete Carrinhos Response.Content
    Resposta Compra Concluida
    validar Status Code "200"

Cenario: DELETE Concluir Compra Sem Carrinho Cadastrado 200
    [Tags]  DELETE_CONCLUIR_COMPRA_CARRINHO_NAO_CADASTRADO
    Iniciar cores de resposta
    POST Login Valido Usando FUNCAO
    DELETE Endpoint /carrinhos Concluir Compra
    Imprimir Delete Carrinhos Response.Content
    Resposta Sem Carrinho Cadastrado 
    validar Status Code "200"

Cenario: DELETE Concluir Token Invalido 401
    [Tags]  DELETE_CONCLUIR_COMPRA_TOKEN_INVALIDO
    Iniciar cores de resposta
    POST Login Valido Usando FUNCAO
    DELETE Endpoint Concluir Compra /carrinhos Token Invalido
    Imprimir Delete Carrinhos Response.Content
    Resposta Carrinho Token Invalido
    validar Status Code "401"


Cenario: DELETE Concluir Token Usuario Excluido 401
    [Tags]  DELETE_COMPRA_TOKEN_USUARIO_EXCLUIDO
    Iniciar cores de resposta
    POST Cadastro Usuario Estatico Valido
    POST Login Usuario Excluido
    DELETE Endpoint /usuarios
    DELETE Endpoint /carrinhos Concluir Compra
    Imprimir Delete Carrinhos Response.Content
    Resposta Carrinho Cadastrado Usuario excluido
    validar Status Code "401"
    










