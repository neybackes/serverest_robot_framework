#Sessão para configuração, documentacao, imports de arquivos e librarys
* Settings *
Documentation   Ações e variáveis para o endpoint /carrinhos
Resource        ../support/base.robot
      


#Sessão para criacao de Keywords Personalizadas
* Keywords *
#--------------------------------------------------------------------------------------------------------------------------------------------------------------

#Relizar cadastro de carrinho vinculado a toke de login acesso 
POST Endpoint Carrinho
    ${header}    Create Dictionary     Authorization=${token_auth}    
    ${response}     POST on Session      serverest         /carrinhos   json=${payload}    headers=${header}         expected_status=anything    
    SET Global Variable     ${response}
    IF    ${response.status_code} == 201
        ${carrinho_id}      SET Variable     ${response.json()["_id"]}  
        Set Global Variable     ${carrinho_id}        
    END
Imprimir Carrinho Response.Content
    IF  ${response.status_code} == 200 or ${response.status_code} == 201 
            Log to console     ${yellow}Resposta para Cadastro de Carrino:${yellow} ${green}${response.content}${green}
        ELSE
            Log to console     ${yellow}Resposta para Cadastro de Carrinho:${yellow} ${red}${response.content}${red} 
    END

#------------------------------------------------------------------------------------------------------------------------------------------------------------
#Relizar POST de carrinho valido 

POST Cadastro Carrinho Estatico Valido
    ${json}     Importar Json Estatico  massa_carrinho.json
    ${payload}  SET Variable     ${json["carrinhos_valido"]}   
    Set Global Variable     ${payload}    
    POST Endpoint Carrinho   

Resposta Carrinho Cadastrado  
    Should Contain         ${response.json()["message"]}       Cadastro realizado com sucesso
    Should not be empty    ${response.json()["_id"]}   
#------------------------------------------------------------------------------------------------------------------------------------------------------------
#Resposta para POST um carrinho por cadastro
Reposta Um carrinho Por Cadastro
    Should Contain         ${response.json()["message"]}       Não é permitido ter mais de 1 carrinho
     
#------------------------------------------------------------------------------------------------------------------------------------------------------------
#Relizar POST de carrinho valido 
POST Cadastro Carrinho Produto Repetido
    ${json}     Importar Json Estatico  massa_carrinho.json
    ${payload}  SET Variable     ${json["carrinhos_produto_repetido"]}   
    Set Global Variable     ${payload}    
    POST Endpoint Carrinho
Resposta Carrinho Produto Duplicado
    Should Contain         ${response.json()["message"]}       Não é permitido possuir produto duplicado 
    Should not be empty    ${response.json()["idProdutosDuplicados"]}  
#------------------------------------------------------------------------------------------------------------------------------------------------------------
#Relizar POST de carrinho sem ID de produto

POST Cadastro Carrinho Produto Nao Encontrado
    ${json}     Importar Json Estatico  massa_carrinho.json
    ${payload}  SET Variable     ${json["carrinhos_id_invalido"]}   
    Set Global Variable     ${payload}    
    POST Endpoint Carrinho
Resposta Carrinho Produto Nao Encontrado
    Should Contain         ${response.json()["message"]}       Produto não encontrado 
    Should not be empty    ${response.json()["item"]}
#------------------------------------------------------------------------------------------------------------------------------------------------------------    
#Realizar POST do Carrinho Com produtos insuficiente

POST Cadastro Carrinho Produto Insuficiente
    ${json}     Importar Json Estatico  massa_carrinho.json
    ${payload}  SET Variable     ${json["carrinho_insuficiente"]}   
    Set Global Variable     ${payload}    
    POST Endpoint Carrinho
Resposta Carrinho Produto Insuficiente  
    Should Contain         ${response.json()["message"]}       Produto não possui quantidade suficiente 

#------------------------------------------------------------------------------------------------------------------------------------------------------------    
#Realizar POST do Carrinho Com Token Ausente/Invalido 
POST Cadastro Carrinho Token Invalido
   ${token_auth}    Set Variable      Não e um TOKEN   
   Set Global Variable     ${token_auth}
   POST Cadastro Carrinho Estatico Valido

Resposta Carrinho Token Invalido
    Should Contain      ${response.json()["message"]}   Token de acesso ausente, inválido, expirado ou usuário do token não existe mais
#------------------------------------------------------------------------------------------------------------------------------------------------------------
#Resposta para POST com toke de usuario excluido
Resposta Carrinho Cadastrado Usuario excluido
    Should Contain      ${response.json()["message"]}   Token de acesso ausente, inválido, expirado ou usuário do token não existe mais


#------------------------------------------------------------------------------------------------------------------------------------------------------------
#Buscar todos os carrinho 

GET Endpoint /carinhos 
    ${response}     GET on Session      serverest         /carrinhos     expected_status=anything
    Set Global Variable     ${response}
    Log to console     ${yellow}Resposta Produto Não Encontrado:${yellow} ${green}${response.content}${green}  
#------------------------------------------------------------------------------------------------------------------------------------------------------------
#Buscar carrinho ID

GET Endpoint FUNCAO /carrinhos/_id
    ${json}         buscar carrinho
    ${response}     GET on Session      serverest         /carrinhos/${json}     expected_status=anything
    Set Global Variable     ${response}
    Log to console     ${yellow}Resposta para Produto Cadastrados ID:${yellow} ${green}${response.content}${green} 

#------------------------------------------------------------------------------------------------------------------------------------------------------------
#Buscar carrinho sem ID
GET Endpoint Estatico /carrinhos/_id Nao Encontrado
    ${response}     GET on Session      serverest         /carrinhos/idinexistente     expected_status=anything
    Set Global Variable     ${response}
    Log to console     ${yellow}Resposta para Produto Cadastrados ID:${yellow} ${red}${response.content}${red}

Resposta Produto Não Encontrado  
    Should Be Equal    ${response.json()["message"]}   Produto não encontrado


#------------------------------------------------------------------------------------------------------------------------------------------------------------
#Deletar CARRINHO CANCELAR COMPRA

DELETE Endpoint /carrinhos Cancelar Compra
    ${header}    Create Dictionary     Authorization=${token_auth} 
    ${response}     DELETE on Session      serverest         /carrinhos/cancelar-compra   headers=${header}    expected_status=anything  
    SET Global Variable     ${response}

Resposta Compra Cancelada
    Should Be Equal    ${response.json()["message"]}    Registro excluído com sucesso. Estoque dos produtos reabastecido

Resposta Sem Carrinho Cadastrado 
    Should Be Equal    ${response.json()["message"]}    Não foi encontrado carrinho para esse usuário

#------------------------------------------------------------------------------------------------------------------------------------------------------------
#Deletar CARRINHO  CANCELAR COMPRA TOKE INVALIDO
DELETE Endpoint Cancelar Compra /carrinhos Token Invalido
    ${token_auth}    Set Variable      Não e um TOKEN 
    ${header}    Create Dictionary     Authorization=${token_auth} 
    ${response}     DELETE on Session      serverest         /carrinhos/cancelar-compra     headers=${header}    expected_status=anything 
    SET Global Variable     ${response}
    SET Global Variable     ${token_auth}  

Imprimir Delete Carrinhos Response.Content
    Log to console     ${yellow}Resposta para Carrinho Deletado:${yellow} ${red}${response.content}${red} 

#------------------------------------------------------------------------------------------------------------------------------------------------------------
#Deletar CARRINHO  CONCLUIR COMPRA
DELETE Endpoint /carrinhos Concluir Compra
    ${header}    Create Dictionary     Authorization=${token_auth} 
    ${response}     DELETE on Session      serverest         /carrinhos/concluir-compra   headers=${header}    expected_status=anything  
    SET Global Variable     ${response}

Resposta Compra Concluida
    Should Be Equal    ${response.json()["message"]}    Registro excluído com sucesso

#------------------------------------------------------------------------------------------------------------------------------------------------------------
#Deletar CARRINHO  CONCLUIR COMPRA TOKE INVALIDO
DELETE Endpoint Concluir Compra /carrinhos Token Invalido
    ${token_auth}    Set Variable      Não e um TOKEN 
    ${header}    Create Dictionary     Authorization=${token_auth} 
    ${response}     DELETE on Session      serverest         /carrinhos/concluir-compra     headers=${header}    expected_status=anything 
    SET Global Variable     ${response}
    SET Global Variable     ${token_auth}  