
  
 #
  
<div align="center">
   <a href="https://www.python.org/doc/" target="_blank"><img src="https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white"></a>
   <a href="https://www.w3schools.com/html/" target="_blank"><img src="https://img.shields.io/badge/HTML-239120?style=for-the-badge&logo=html5&logoColor=white"></a>
   <a href="https://www.markdownguide.org/getting-started" target="_blank"><img src="https://img.shields.io/badge/Markdown-000000?style=for-the-badge&logo=markdown&logoColor=white"></a>
   <a href="https://git-scm.com/doc" target="_blank"><img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white"></a>
   <a href="https://git-scm.com/doc" target="_blank"><img src="https://img.shields.io/badge/Node.js-43853D?style=for-the-badge&logo=node.js&logoColor=white"></a>
</div>

#

 <div style="display: inline_block" align="center">   
   <a href="" target="_blank"><img src="https://upload.wikimedia.org/wikipedia/commons/e/e4/Robot-framework-logo.png" width="50px"></a>
   <a href="" target="_blank"><img src="https://user-images.githubusercontent.com/105370199/175366115-5504e3c2-804e-4f9c-aa78-8e66896fcb54.png" width="50px"></a>
  
 </div>


  
  # - Introdução

Seja bem vindo! Este repositório foi desenvolvido durante o desafio da Sprint 6 do Programa de Bolsas da Compass. Como desafio final o projeto contempla um mapeamento da API REST Serverest, validando suas requisições e pontos de acesso. Neste projeto é utilizado o Robot Framework que é a principal ferramenta para o processos de automação.<br>
No material explicativo você vai encontrar todas as informações referentes ao desenvolvimento deste trabalho, ferramentas utilizadas, instalações, observações, mapeamento de testes, além de um código comentado para facilitar o entendimento e a reutilização deste projeto.
.

##  Objetivos 

  

- Apresentar um projeto de automação com o Robot Framework; 
- Apresentar os processos de encadeamento e autenticação;
- Apresentar uma projeto desenvolvido nos padrões Service Object;
- Apresentar uma proposta de automação, além de demonstrar sua forma de utilização;
- Demonstrar a utilização e consumo de uma Library Python;
- Aplicar dados estático e dinâmicos para a realização dos testes;
- Identificar os casos de testes e suas automações.




# - Sobre o Robot Framework


 <div> 
   <img src="https://user-images.githubusercontent.com/105370199/178865528-2159ef69-2c2e-44b1-a475-07badad775d7.gif" width="50px" />
</div>
<br>

O Robot Framework é uma estrutura de automação de código aberto genérica para desenvolvimento orientado a testes de aceitação (ATDD) e automação de processos robóticos (RPA).

Seus recursos de teste podem ser estendidos por bibliotecas de teste implementadas como Python ou Java, e os usuários podem criar novas palavras-chave de nível mais alto a partir de palavras-chave existentes usando a mesma sintaxe usada para criar casos de teste.

O projeto do Robot Framework está hospedado no  <a href="https://auditeste.com.br/o-que-e-ferramenta-robot-framework-e-como-ela-funciona/" target="_blank">Github.</a><br>
<div>   
   <a href="https://auditeste.com.br/o-que-e-ferramenta-robot-framework-e-como-ela-funciona/" target="_blank">Saiba Mais</a><br>
</div>



### Estrutura Robot Exemplo

```python
#Sessão para configuração, documentacao, imports de arquivos e librarys
* Settings *
Documentation   Nome do documento para explicar o que o programa faz.  
Library             RequestsLibrary

#Sessão para setagem de variáveis
* Variables *

#utilizando variaves para armazenar informações repetidas
${nome_de_sua_variavel}    valor da variavel 



#Sessão para criacao dos cenários de teste
* Test Cases *


#Sessão para criacao de Keywords Personalizadas
* Keywords *



```


 <div>
 <br>
<strong> Robot Framework e Dependências</strong>
<br>

 <br>
 
 <table width="100px">
<tr><a href="" target="_blank"></th></tr>
<tr><td>

<td>

Biblioteca | Versão | Utilização |
---- | ---- | ---- |
 <a href="https://medium.com/@mayfernandes/season-tutoriais-ep-01-instalando-o-robot-framework-windows-aebf4477bcae" target="_blank">Robot Framework</a><br> | 5.0.1 | Robot Framework é uma estrutura de automação genérica open source, ou seja, de código aberto que pode ser usado para testar e automatizar processos de software. |
 <a href="https://robotframework-browser.org/" target="_blank">Robot Framework Browser</a><br> | 0.1.0 | BrowserLibrary utiliza uma tecnologia baseada em JavaScript chamada Playwright. O dramaturgo se conecta diretamente à API do navegador e tem controle total do navegador e de seu conteúdo. |
 <a href="https://github.com/MarketSquare/robotframework-requests" target="_blank">Robot Framework Request</a><br>| 2.25.1 | RequestsLibrary é uma biblioteca Robot Framework destinada a fornecer funcionalidades de teste de API HTTP, envolvendo a conhecida Biblioteca de Solicitações Python.|
 <a href="https://pypi.org/project/robotframework-faker/" target="_blank">Robot Framework Faker</a><br>| 1.16.0 | FakerLibrary é uma biblioteca que permite o uso fácil da geração de dados de teste aleatório do Faker no Robot Framework.
 
</td></tr> </table>

</div>

####  Intalações de pacotes ou dependências via pip (gerenciandor de pacotes)
  
  <strong>Exemplo</strong>
 
  - Digite no seu prompt ou terminal ou comando: "pip install <nome_da_dependência>" e presione "Enter"
  <div> 
    <img src="https://user-images.githubusercontent.com/105370199/182438349-e2fe6536-491c-4c19-a775-ac2046b4b7bb.png" width="1000px" />
  </div>

<div>

### Ferramentas Adicionais Utilizadas

|Ferramenta | Versão     | Instalação                                                    |
| -------- | ---------- | ------------------------------------------------------------ |
| Python | 3.10 | - <a href="https://www.python.org/downloads/" target="_blank">- Download Windows</a><br /> - Para a instalação baixe a versão correspondente e siga as intruções de instalação.<br /> <strong>Instalação Linux via terminal</strong>. <br /> - Verifique se você tem o python instalado: "which python" ou "which python3" <br /> - Instalação: sudo apt-get install python3 <br />  |
|Git   | 2.34,1 | - Acesse a documentação oficial <br /> <a href="https://git-scm.com/book/pt-br/v2/Come%C3%A7ando-Instalando-o-Git" target="_blank">- Guia de instalaçao</a>  <br /> |
|Vscode | 1.68.1 | - <br /> <a href="https://code.visualstudio.com/Download" target="_blank">- Download Windows</a><br /> - Para a instalação baixe a versão correspondente e siga as intruções de instalação.<br /><strong>Instalação Linux via terminal</strong> <br />- Instalação: "sudo snap install code --classic"<br /> - Não se esqueca de atualizar: "sudo snap refresh code"|
|Node | 16.16.0 Lts| -<a href="https://code.visualstudio.com/Download" target="_blank"> Download Site Oficial</a><br />``


 </div>

<br>

# - API REST Serverest
  O ServeRest é uma API REST gratuita que simula uma loja virtual com intuito de servir de material de estudos de testes de API.
  Neste projeto a Serverest foi utilizada localmente para evitar problemas ou até mesmo conflitos com dados postados no servidor publico online.
  
  <div>   
   <a href="https://serverest.dev/" target="_blank">Conheça a API REST Serverest</a><br>
</div>
<br>
<br>
 - <strong>Como utilizar a Serverest localmente</strong>
 <br>

  Após a instalação do Node.js você pode executar facilmente o servidor Serverest local no seu terminal ou cmd com o seguinte comando:
    
 - npx serverest (após a execução do comando o servidor abrira em uma nova porta no seu navegaor e você poderá utilizar este endereço como acesso para os seus testes)
 - <strong>Exemplo</strong>
 <div> 
   <img src="https://user-images.githubusercontent.com/105370199/178840558-a437af82-f045-46f6-9bee-7dd647086f86.png" width="800px" />
</div>
 
 <br>
 
  <strong> Mapeamento da API SERVEREST</strong>
 
  O mapa mental foi desenvolvido pensando no aprendizado de sprint passadas do programa, no lado esquerdo o /carrinho está como não prioritário e o         restante dos caminhos como prioritários. Entretanto, neste projeto todos os pontos foram testados para garantir uma maior cobertura e aprendizado na       automação de testes.

 <div> 
   <img src="https://user-images.githubusercontent.com/105370199/182244002-b4bd71ff-1e98-4a2e-aa77-51e654f578b2.png" width="800px" />
</div>
 
 # - Casos de testes e Relatório de Execução de Testes
  
 
  - <a href="https://github.com/backespucpr/Robotron_NeyBackes_ProjetoFInal/blob/DEVOLOP/support/casos_de_teste.txt" target="_blank">A lista completa com todos os casos de teste.</a><br>
  
`
<br>

   <strong>Relatório de Execução de Testes</strong>
  
   Para verificação do relatório completo da execução dos testes acesse - <a href="https://backespucpr.github.io/reports_test/" target="_blank">Relatório    de Execução</a><br>

  No total foram 53 testes executados nos 4 Endpoints da API REST Serverest

   - /login  - 4 Testes 
   - /usuários - 11 Testes
   - /produtos - 20 Testes
   - /carrinhos - 18 Testes

<strong>Cenarios de teste não automatizados.</strong>


Pensando na independência de cada cenário de teste, a validação de um cenário utilizando um token expirado dependeria da criação e do aguardo de 10 minutos para sua expiração.
Existem algumas alternativas no próprio Serverest local para iniciar com um tempo de token reduzido, entretanto esta ação invalidaria os dados relacionados na documentação em relação aos outros casos de teste.
Deste modo, os casos de teste foram descritos mas não executados na automação, tornando-se candidatos para uma automação manual.

Segue a seguir:

- PRODUTOS<br>
	<strong> POST</strong>
	- Alteração com Token Expirado #não automatizado
	- Status Code "401"
	 - Mensagem de retorno "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
  - Status Code "401"<br>
       <strong>PUT</strong> 
  	- Alteração com Token Expirado #não automatizado 
 	 - Status Code "401"
	 - Mensagem de retorno "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"<br>
	<strong>DELETE - /{_id}</strong> 
		- Deletar Produto com Token Expirado #não automatizado
  		- Status Code "401"
		- Mensagem de retorno "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
- CARRINHOS<br>
<strong> POST</strong>
	- Alteração com Token Expirado #não automatizado 
  - Status Code "401"
  - Mensagem de retorno "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"<br>
	<strong>DELETE /cancelar Compra</strong><br>
	- Alteração com Token Expirado #não automatizado 
  	- Status Code "401"
	- Mensagem de retorno "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"<br>
	<strong>DELETE Concluir Compra</strong>
		- Alteração com Token Expirado #não automatizado 
  		- Status Code "401"
		- Mensagem de retorno "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"<br>


### Atenção! Para fins de aprendizado todos os testes são validados, entretando foram encontrados algumas falhas que são reportadas abaixos.

<strong>Problemas ou inconsistências encontradas durante os testes.</strong>

Durante a reprodução dos testes seguindo as documentações da API REST Serverest foram encontrados repostas não mapeadas ou respostas diferentes da documentação.

Segue a seguir:

- LOGIN<br>
	<strong> POST</strong>
	- Requisição com email inválido
		- Status Code "401" - Na documentação o status era 400
	- Requisição com senha inválida 
		- Status Code "401" - Na documentação o status era 400
	- Requisicao com senha em branco ""
	 	- Status Code "401" 
		- Validação não está na cobertura da documentação Serverest
	- Requisicao com email em branco ""
	 	- Status Code "401" 
		- Validação não está na cobertura da documentação Serverest
 	
- USUARIOS<br>
<strong> DELETE</strong>
	- Deletar um usuario que não existe
		- Status Code "200" - Não seria 400?
  
- CARRINHOS<br>
<strong> Cancelar compra </strong>
	- Cancelar compra sem cadastro 
		- Status Code "200" - Não seria 400?
	- Cancelar Compra- /{_id}
		- Mensagem de retorno "Registro excluído com sucesso"
		- Recebido “Registro excluído com sucesso. Estoque dos produtos reabastecido”
	
 




   




  
# - Como utilizar este projeto e realizar os testes

  Este projeto está organizado seguindo os padrões Service Object permitindo que sua utilização seja simplificada e que cada Endpoint possa ser testado       individualmente.
  
 <div> 
   <img src="https://user-images.githubusercontent.com/105370199/182450808-da42aedb-368e-4e04-a00d-a2e65c908873.png" width="800px" />
</div>

  <br>
  
 <strong> - Principais comandos para execução dos testes </strong>
  
   <br>
   
   Para realizar os testes por arquivo utilize o comando a seguir no seu terminal ou cmd
  - robot -d ./reports ./tests/arquivo_na_pasta_test.robot  
  <strong>Exemplo</strong>
  <br> 
        
 <div> 
   <img src="https://user-images.githubusercontent.com/105370199/182451945-08f2373e-0b2f-4274-ba6f-f7b5d01bcd4e.png" width="800px" />
</div>

  <br>
        
   Cada caso de teste possui uma tag ou seja pode ser executado individualmente.
   
   Para executar um cenário de teste pela tag utilize o comando a seguir 
   
   - robot -d ./reports -i TAG ./tests/arquivo_na_pasta_test.robot   
   <strong>Exemplo</strong>
  <br> 
  
 <div> 
   <img src="https://user-images.githubusercontent.com/105370199/182453176-8ca8349b-299a-4225-9eba-165cc00bd7ea.png" width="800px" />
</div>


<br>
<br>


<strong> - Para contribuir ou mesmo utilizar o conteúdo deste repositório você tem duas opções: Clonar este repositório ou baixa-lo via ZIP.</strong>

<div> 
   <img src="https://user-images.githubusercontent.com/105370199/175949914-ed248ef0-3390-4259-aec0-caea361a3528.gif" width="200px" />
</div>

<strong>- Clonando o repositório </strong>

- No GitHub.com, navegue até a página principal do repositório.
- Acima da lista de arquivos, clique em  código.
- Copie a URL para o repositório.<br>
- Abra Git Bash. (Terminal ou Prompt)
- Altere o diretório de trabalho atual para o local em que deseja ter o diretório clonado.
- Digite git clone (clonar git) e cole a URL que você copiou anteriormente.

```python
$ git clone https://github.com/YOUR-USERNAME/YOUR-REPOSITORY
   


```

- Pressione Enter para criar seu clone local.

```python
$ git clone https://github.com/YOUR-USERNAME/YOUR-REPOSITORY
> Cloning into `Spoon-Knife`...
> remote: Contando objetos: 10, concluído.
> remote: Compactando objetos: 100% (8/8), concluído.
> remove: Total 10 (delta 1), reused 10 (delta 1)
> Unpacking objects: 100% (10/10), done.   
.
```





# - Agradecimentos

Neste momento gostaria de agradecer a todos que fizeram parte desta jornada. Como iniciante no mercado de programação principalmente na área de testes, me sinto privilegiado por ter tido a oportunidade de fazer parte deste projeto.

O aprendizado foi incrível, mas acima de tudo o companheirismo e apoio dos colegas e evangelistas nesta jornada foi o que me deixou mais feliz e motivado.

Por fim só tenho a agradecer novamente o oportunidade de fazer parte da equipe Compass e com certeza todas essa experiência enriquecedora irá seguir comigo durante toda a minha vida profissional.


<strong>Colegas que ajudaram na resolução das atividades e na elaboração deste projeto</strong>
<div>   
   <a href="https://github.com/abressam" target="_blank">- Amanda Bressam </a><br>
   <a href="https://github.com/manuel-valdes" target="_blank">- Manuel Valdes </a><br> 
   <a href="https://github.com/eslanzarin" target="_blank">- Emily Suzan Lanzarin </a><br> 
   <a href="https://github.com/BeatrizJardimm" target="_blank">- Paula Beatriz </a><br>
</div>
<br>

<strong>Mentores </strong>

<div>   
   <a href="https://github.com/DemetrioWebber" target="_blank">- Demetrio Webber </a><br>
   <a href="https://github.com/matheuslocatelli" target="_blank">- Matheus Locatelli</a><br>   
</div>
<br>

<strong>Elaboração do README.md</strong>
<div>   
   <a href="https://www.youtube.com/watch?v=TsaLQAetPLU&t=1s" target="_blank">- Rafaella Ballarine - Como personalizar o seu perfil no Github (Readme)</a><br>
   <a href="https://www.youtube.com/watch?v=jIa8R69pKh8" target="_blank">- DevSuperior - Como fazer um README para portfolio no Github</a><br>
   <a href="https://www.youtube.com/watch?v=oMFiGEZ6UlQ&t=156s" target="_blank"> - kaká cordovil - Como adicionar imagem no readme do GitHub</a>
</div>
<br>
<strong>Repositórios utilizados como exemplo</strong>
<br>
<br>

<div>   
   <a href="https://github.com/graph4ai/graph4nlp" target="_blank">- Graph4NLP</a><br>
   <a href="https://github.com/rafaballerini" target="_blank">- Rafaella Ballerini</a><br>
   <a href="https://github.com/ohmyzsh/ohmyzsh" target="_blank"> - OhMyZsh </a><br>
   <a href="https://github.com/luong-komorebi/Markdown-Tutorial" target="_blank"> - Markdown-Tutorial </a>
</div>
<br>
<br>

<strong>Aprendizado sobre Git e Github</strong>
<div>   
   <a href="https://www.youtube.com/watch?v=kB5e-gTAl_s&t=1121s" target="_blank">- Dev Aprender - Curso de Git e Github COMPLETO 2021 [Iniciantes] + Desafios + Muita Prática</a><br>
   <a href="https://www.youtube.com/watch?v=myQuetgSEsY" target="_blank">- Código Fonte TV - GITHUB // Dicionário do Programador</a><br>
   <a href="https://www.youtube.com/watch?v=SWYqp7iY_Tc&list=RDQMD9DH5noB57Y&start_radio=1" target="_blank"> - Git & GitHub Crash Course For Beginners</a>
</div>

<br>


## Em caso de dúvidas ou sugestões entre em contato
   
   </div>
<div style="display: inline_block">
  <a href="https://www.linkedin.com/in/silvioney-backes-27673b214/" target="_blank"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white"></a>
  <a href="backesney@gmail.com" target="_blank"><img src="https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white"></a>  
  </div>
  <br>
  <br>
