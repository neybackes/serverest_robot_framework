# ServeRest Robot Framework

Projeto de automacao de API com Robot Framework para validar fluxos da
[ServeRest](https://serverest.dev/). A estrutura separa suites, keywords,
payloads, configuracoes e assercoes para facilitar manutencao e crescimento do
projeto.

## Visao Geral

- Testes de API com `Robot Framework` e `robotframework-requests`
- Gerenciamento de dependencias com `Poetry`
- Execucao local contra uma instancia ServeRest
- Relatorios gerados em `reports/`
- Pipeline de CI com GitHub Actions

## Pre-requisitos

- Python `>=3.10,<3.14`
- Poetry
- Node.js e npm, para subir o ServeRest localmente com `npx serverest`

## Instalacao

```bash
poetry install
```

## Executando Localmente

Em um terminal, suba a API ServeRest:

```bash
npx serverest
```

Em outro terminal, execute toda a suite:

```bash
poetry run task test
```

Tambem e possivel executar diretamente com Robot:

```bash
poetry run robot -d reports tests/
```

Para rodar apenas os testes de login:

```bash
poetry run task test_login
```

## Configuracao

Por padrao, o projeto usa:

```text
http://localhost:3000
```

Para apontar para outra URL, defina a variavel de ambiente `API_BASE_URL`.

PowerShell:

```powershell
$env:API_BASE_URL="http://127.0.0.1:3000"
```

Bash:

```bash
export API_BASE_URL="http://127.0.0.1:3000"
```

## Estrutura

```text
serverest_robot_framework/
|-- .github/
|   `-- workflows/
|       `-- ci.yml
|-- resources/
|   |-- config/
|   |   |-- base.resource
|   |   `-- environments/
|   |       `-- variables.resource
|   |-- keywords/
|   |   `-- login_keywords.resource
|   |-- payloads/
|   |   |-- login_payloads.resource
|   |   `-- estatic/
|   |       `-- massa_login.json
|   `-- utils/
|       |-- assertions/
|       |   |-- body_assertions.resource
|       |   `-- status_assertions.resource
|       `-- common.resource
|-- tests/
|   `-- login/
|       `-- login_test.robot
|-- reports/
|-- pyproject.toml
|-- robot.toml
`-- README.md
```

## Cenario Coberto

### Login

- Cria um usuario valido
- Realiza login com os dados gerados
- Valida status `200`
- Valida mensagem de sucesso
- Valida retorno do token `authorization`
- Remove o usuario criado ao final do teste

## Comandos Uteis

```bash
poetry run task test
poetry run task test_login
poetry run robot -d reports tests/
```

O `pyproject.toml` tambem possui a task `test_users`, preparada para quando a
suite de usuarios for adicionada ao projeto.

## Relatorios

Apos a execucao, os artefatos ficam em `reports/`:

- `report.html`
- `log.html`
- `output.xml`

## CI

O workflow em `.github/workflows/ci.yml` executa os testes em pushes para
`main`/`master` e em pull requests. O pipeline instala Python, Node.js, Poetry,
sobe o ServeRest e roda a suite Robot.

## Evolucao do Projeto

Para adicionar novos fluxos:

1. Crie uma nova suite em `tests/`
2. Adicione keywords reutilizaveis em `resources/keywords/`
3. Centralize massas em `resources/payloads/`
4. Reaproveite assercoes de `resources/utils/assertions/`
5. Adicione uma task no `pyproject.toml`, se fizer sentido
