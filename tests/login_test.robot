#Sessão para configuração, documentacao, imports de arquivos e librarys
* Settings *

Documentation   Arquivos de teste para o endpoint de /login
Resource        ../keywords/login_keywords.robot

Suite Setup     Criar Sessao
 




#Sessão para criacao dos cenários de teste
* Test Cases *

#VALIDAÇÕES NO ENDPOINT /login

Cenario: POST Realizar Login 200
    [Tags]    POST_LOGIN
    Iniciar cores de resposta    
    POST Login Valido Usando FUNCAO
    Imprimir Login Response.Content
    Resposta Login Valido     
    validar Status Code "200"    

Cenario: POST Realizar Login Invalido 401
    [Tags]    POST_LOGIN_INVALIDO
    Iniciar cores de resposta     
    POST Login Dinamico Invalido 
    Imprimir Login Response.Content
    Resposta Login Invalido     
    validar Status Code "401"

Cenario: POST Realizar Login Sem Senha 400
    [Tags]    POST_LOGIN_SEM_SENHA
    Iniciar cores de resposta   
    POST Login Dinamico Sem Senha
    Imprimir Login Response.Content
    Resposta Login Sem Senha    
    validar Status Code "400"

Cenario: POST Realizar Login Sem Email 400
    [Tags]    POST_LOGIN_SEM_EMAIL
    Iniciar cores de resposta    
    POST Login Dinamico Sem Email
    Imprimir Login Response.Content
    Resposta Login Sem Email   
    validar Status Code "400"
    
    