#Sessão para configuração, documentacao, imports de arquivos e librarys
* Settings *
Documentation   Ações e variáveis para o endpoint /produtos
Resource        ../support/base.robot



#Sessão para criacao de Keywords Personalizadas
* Keywords *
#--------------------------------------------------------------------------------------------------------------------------------------------------------------

#Keyword para realizar o cadastro de produto

POST Endpoint Produtos
    ${header}    Create Dictionary     Authorization=${token_auth}    
    ${response}     POST on Session      serverest         /produtos    json=${payload}    headers=${header}         expected_status=anything
    SET Global Variable     ${response}      
    IF    ${response.status_code} == 201
        ${produto_id}      SET Variable     ${response.json()["_id"]}  
        Set Global Variable     ${produto_id}         
    END      
#Imprimir conteudo da resposta no console
Imprimir Produto Response.Content
    IF  ${response.status_code} == 200 or ${response.status_code} == 201 
            Log to console     ${yellow}Resposta para Cadastro de Produto:${yellow} ${green}${response.content}${green}
        ELSE
            Log to console     ${yellow}Resposta para Cadastro de Produto:${yellow} ${red}${response.content}${red} 
    END

#--------------------------------------------------------------------------------------------------------------------------------------------------------------
# Cadastro de Usuario com dados estaticos

POST Cadastro Produto Estatico Valido
    ${json}     Importar Json Estatico  massa_produtos.json
    ${payload}  SET Variable     ${json["produto_para_cadastro"]}    
    Set Global Variable     ${payload}    
    POST Endpoint Produtos
Resposta Produto Cadastrado  
    Should Contain         ${response.json()["message"]}        Cadastro realizado com sucesso
    Should not be empty    ${response.json()["_id"]}   

#--------------------------------------------------------------------------------------------------------------------------------------------------------------
#Keyword para produto repetido
POST Cadastro Produto Estatico Repetido
    ${json}     Importar Json Estatico  massa_produtos.json
    ${payload}  SET Variable     ${json["produto_nome_repetido"]}    
    Set Global Variable     ${payload}    
    POST Endpoint Produtos

Resposta Produto Repetido 
    Should Contain  ${response.json()["message"]}    Já existe produto com esse nome

#--------------------------------------------------------------------------------------------------------------------------------------------------------------
# Cadastro com produto Token Invalido
POST Cadastro Produto Token Invalido
    ${token_auth}    Set Variable      Não e um TOKEN   
    Set Global Variable     ${token_auth}
    POST Cadastro Produto Estatico Repetido
#--------------------------------------------------------------------------------------------------------------------------------------------------------------
#Reposta produto TOKE invalido     

Resposta Produto Token Invalido
    Should Contain      ${response.json()["message"]}   Token de acesso ausente, inválido, expirado ou usuário do token não existe mais
#--------------------------------------------------------------------------------------------------------------------------------------------------------------
#Reposta para produto com adm false

Resposta Produto Cadastrado Administrador False
    Should Contain  ${response.json()["message"]}   Rota exclusiva para administradores
#--------------------------------------------------------------------------------------------------------------------------------------------------------------
#Resposta user exluido

Resposta Produto Cadastrado Usuario excluido
    Should Contain  ${response.json()["message"]}   Token de acesso ausente, inválido, expirado ou usuário do token não existe mais

#---------------------------------------------------------------------------------------------------------------------------------------------------------
#listar produtos cadastrados
GET Endpoint /produtos    
    ${response}     GET on Session      serverest         /produtos    
    Set Global Variable     ${response}
    Log to console    ${yellow}Resposta para Produtos Cadastrados:${yellow} ${green}${response.content}${green}

#---------------------------------------------------------------------------------------------------------------------------------------------------------
#listar produtos por ID
GET Endpoint FUNCAO /produtos/_id
    ${json}        buscar produto       
    ${response}    GET on Session      serverest         /produtos/${json}  
    Set Global Variable     ${response}    
    Log to console     ${yellow}Resposta para Produto Cadastrados ID:${yellow} ${green}${response.content}${green} 
#---------------------------------------------------------------------------------------------------------------------------------------------------------
#listar produtos por ID inexistente
GET Endpoint Estatico /produto/_id Nao Encontrado
    ${response}     GET on Session      serverest         /produtos/idinexistente  expected_status=anything
    Set Global Variable     ${response}
    Log to console     ${yellow}Resposta Produto Não Encontrado:${yellow} ${red}${response.content}${red}    
Resposta Produto Não Encontrado  
    Should Be Equal    ${response.json()["message"]}   Produto não encontrado


#---------------------------------------------------------------------------------------------------------------------------------------------------------
#ALterar produto
PUT Endpoint Produtos
    ${header}    Create Dictionary     Authorization=${token_auth}    
    ${response}     PUT on Session      serverest         /produtos/${produto_id}    data=${payload}    headers=${header}         expected_status=anything         
    IF  ${response.status_code} == 200 or ${response.status_code} == 201 
        Log to console     ${yellow}Resposta para Alteração de Produto:${yellow} ${green}${response.content}${green}
      ELSE
        Log to console     ${yellow}Resposta para Alteração de Produto:${yellow} ${red}${response.content}${red} 
    END
    IF    ${response.status_code} == 201
        ${produto_id}      SET Variable     ${response.json()["_id"]}  
        Set Global Variable     ${produto_id}         
    END 
    SET Global Variable     ${response} 

#---------------------------------------------------------------------------------------------------------------------------------------------------------
#Alterar produto cadastrado
PUT Cadastro Produto Estatico Valido
    ${json}     Importar Json Estatico  massa_produtos.json    
    ${payload}  SET Variable     ${json["produto_para_alteracao"]}
    Set Global Variable     ${payload}   
    PUT Endpoint Produtos

Resposta Produto Alterado   
    Should Be Equal    ${response.json()["message"]}    Registro alterado com sucesso
#---------------------------------------------------------------------------------------------------------------------------------------------------------
#Alterar produto sem ID 
PUT Alterar Produto Estatico Valido Sem ID
    ${json}     Importar Json Estatico  massa_produtos.json    
    ${payload}  SET Variable     ${json["produto_para_alteracao"]}
    Set Global Variable     ${payload}
    ${produto_id}      SET Variable     invalido
    SET Global Variable     ${produto_id}
    PUT Endpoint Produtos
Resposta Produto Alterado Sem ID
    Should Be Equal        ${response.json()["message"]}    Cadastro realizado com sucesso
    Should not be empty    ${response.json()["_id"]}

#---------------------------------------------------------------------------------------------------------------------------------------------------------
#Alterar produto com nome repetido    
PUT Cadastro Produto Estacico Nome Repetid0
    ${json}     Importar Json Estatico  massa_produtos.json    
    ${payload}  SET Variable     ${json["produto_nome_repetido"]}
    Set Global Variable     ${payload}   
    PUT Endpoint Produtos

Resposta Produto Nome Repetido
    Should Be Equal    ${response.json()["message"]}    Já existe produto com esse nome
#---------------------------------------------------------------------------------------------------------------------------------------------------------
# Cadastro com produto Token Invalido
PUT Alteracao Produto Token Invalido
    ${token_auth}    Set Variable      Não e um TOKEN   
    Set Global Variable     ${token_auth}
    PUT Alterar Produto Estatico Valido Sem ID
#---------------------------------------------------------------------------------------------------------------------------------------------------------
# Deletar Produto Cadastrado
DELETE Endpoint /produtos  
    ${header}    Create Dictionary     Authorization=${token_auth} 
    ${response}     DELETE on Session      serverest         /produtos/${produto_id}    headers=${header}    expected_status=anything            
    SET Global Variable     ${response}

Resposta Produto Excluido 
    Should Be Equal    ${response.json()["message"]}    Registro excluído com sucesso

#---------------------------------------------------------------------------------------------------------------------------------------------------------
#Deletar produto SEM ID

DELETE Endpoint /produtos Nao Encontrado
    ${header}    Create Dictionary     Authorization=${token_auth} 
    ${response}     DELETE on Session      serverest         /produtos/naoexiste    headers=${header}    expected_status=anything            
    SET Global Variable     ${response}
Resposta Delete Produto ID inexistente
    Should Be Equal    ${response.json()["message"]}     Nenhum registro excluído
#---------------------------------------------------------------------------------------------------------------------------------------------------------
#Deletar produto com carrinho cadastrado

DELETE Endpoint /produtos Carrinho Cadastrado         
    ${header}    Create Dictionary     Authorization=${token_auth}
    ${json}      buscar produto 
    ${response}     DELETE on Session      serverest         /produtos/${json}      headers=${header}    expected_status=anything 
    SET Global Variable     ${response}

Resposta Produto Excluido Carrinho Cadastrado
    Should Be Equal    ${response.json()["message"]}    Não é permitido excluir produto que faz parte de carrinho
    Should not be empty    ${response.json()["idCarrinhos"]}

#---------------------------------------------------------------------------------------------------------------------------------------------------------
#Deletar produto com token invalido 

DELETE Endpoint /produtos Token Invalido
    ${token_auth}    Set Variable      Não e um TOKEN 
    ${header}    Create Dictionary     Authorization=${token_auth}
    ${json}      buscar produto 
    ${response}     DELETE on Session      serverest         /produtos/${json}     headers=${header}    expected_status=anything 
    SET Global Variable     ${response}
    SET Global Variable     ${token_auth}  

Resposta delete produto adm false
    Should Be Equal    ${response.json()["message"]}    Rota exclusiva para administradores

#---------------------------------------------------------------------------------------------------------------------------------------------------------
#Imprimir a respota para DELETE 

Imprimir Delete Produto Response.Content
    Log to console     ${yellow}Resposta para Produto Deletado:${yellow} ${red}${response.content}${red} 

  
