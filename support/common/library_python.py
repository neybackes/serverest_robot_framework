from faker import Faker
import requests as req
import json


#funcao para login padrao com dados standard do serverest
# A funcao login padrao é utilizada dados da keyword login 
def login_padrao():
    request = req.get("http://localhost:3000/usuarios")
    request =  request.json()
    email_padrao = request['usuarios'][0]['email']
    senha_padrao = request['usuarios'][0]['password']
    login_padrao = {'email': email_padrao, 'password': senha_padrao}
    return login_padrao
 
#funcao para localizar o id do meu usario padrao com dados standard do serverest
def buscar_usuario():
    request = req.get("http://localhost:3000/usuarios")
    request =  request.json()
    user_padrao = request['usuarios'][0]['_id']
    return  user_padrao

#funcao para localizar o id do produto padrao com dados standard do serverest
def buscar_produto():
    request = req.get("http://localhost:3000/produtos")
    request =  request.json()
    produto_padrao = request['produtos'][0]['_id']
    return produto_padrao

#funcao para localizar o id do carrinho padrao com dados standar do serverest
def buscar_carrinho():
    request = req.get("http://localhost:3000/carrinhos")
    request =  request.json()
    carrinho_padrao = request['carrinhos'][0]['_id']
    return carrinho_padrao


            
    




    

