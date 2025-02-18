# Sistema de Controle de Entrada

O sistema tem como objetivo armazenar os registros de entradas de pessoas (visitantes) que frequentam uma determinada unidade de uma instituição.

## Sumário

- [Requisitos](#requisitos)
- [Funcionalidades](#funcionalidades)
- [Tecnologias usadas](#tecnologiasusadas)
- [Usando localmente](#usandolocalmente)
- [Usuários](#usuários)

## 📑 Requisitos

O sistema tem como objetivo armazenar os registros de entradas de pessoas (visitantes) que frequentam uma determinada unidade de uma instituição.
A instituição possui varias unidades e cada unidade armazena apenas os dados de visita da sua unidade. Porém, compartilham do cadastro dos visitantes afim de agilizar o processo.
Cada unidade possui vários setores com seus respectivos funcionários, os quais deveram ser informados no momento do registro da visita.
O registro da visita deverá solicitar os seguintes dados do visitante: CPF, nome, RG, telefone e foto (webcam). Caso o visitante já tenha sido cadastrado anteriormente, ao preencher o CPF, o sistema deve consultar e apresentar os dados do visitante. E solicitar que informe o setor e funcionário (opcional) ao qual será feita a visita. Ao final o sistema deve registrar a data e hora da visita.
O sistema deve possuir 3 níveis de permissão de usuário, Administrador que poderá cadastrar as unidades, setores, funcionários e os usuários; Atendente que será responsável pelo cadastro do visitante e registro das visitas apenas de sua unidade; e Funcionário que poderá visualizar a lista de visitantes que estão aguardando, bem como notificar ao sistema sobre a realização da visita. O sistema deve exibir as funcionalidades conforme a permissão de cada usuário.

## 📌 Funcionalidades

- Cadastro e autenticação de usuários
- Registro de visitas vinculadas a setores e funcionários.
- Listagem de visitas em andamento e finalizadas. (Dashboard de Atendente)
- Se o visitante já estiver cadastrado, os dados seram automaticamente preenchidos(Logo que entrar em /visitas/new, recarregar a página).
- Permissão para funcionários finalizarem visitas dentro de sua unidade.
- Controle de acesso baseado em funções (Administrador, Atendente e Funcionário).

## 🛠️ Tecnologias usadas

- Ruby on Rails 8.0
- PostgreSQL
- Devise (Autenticação)
- Cancancan (Autorização)
- CarrierWave(Upload de fotos)
- Bootstrap

## 🚀 Usando localmente

Clone o repo

```bash
git clone https://github.com/gabriel-am12/controle_entrada.git
```

- Navegue até o diretório:

```bash
cd controle_entrada
```

- Instale as dependências:

```bash
bundle install
```

- Configure o Banco de Dados

```bash
rails db:create db:migrate
```

- Inicie o servidor

```bash
rails server
```

## 🔑 Usuários

- Admin - Realiza operações de CRUD nas entidades Unidades, Setores, Funcionários e os Usuários;
- Atendente - Cadastro de Visitntes e registro das Visitas especificas da sua Unidade;
- Funcionário - Pode visualizar e finalizar visitas do seu setor, ao finaliza-la, ela aparecerá com a data de saída na dashboard de atendentes.
