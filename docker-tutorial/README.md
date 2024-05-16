# Tutorial Docker

Neste tutorial, você aprenderá os conceitos básicos do Docker e como usá-lo para criar e gerenciar contêineres.

## Conteúdo

- [Instalação do Docker](#instalação-do-docker)
- [Executando seu primeiro contêiner](#executando-seu-primeiro-contêiner)

## Instalação do Docker

...

## Executando seu primeiro contêiner

### Comando:

```bash
docker run --name -e POSTGRES_USER=root -e POSTGRES_PASSWORD=root -p 5432:5432 -d postgres
```

- `docker run`: Comando para criar e executar um contêiner a partir de uma imagem.
- `--name pg`: Define o nome do contêiner como "pg".
- `-e POSTGRES_USER=root`: Define a variável de ambiente `POSTGRES_USER` com o valor "root", especificando o nome de usuário do PostgreSQL.
- `-p 5432:5432`: Mapeia a porta 5432 do host para a porta 5432 do contêiner, permitindo acessar o PostgreSQL do host.
- `-d`: Executa o contêiner em segundo plano (modo "detached").
- `postgres`: Especifica a imagem do Docker a ser usada para criar o contêiner, neste caso, o PostgreSQL.

## Usando docker-compose

Além do comando `docker run`, você também pode utilizar o arquivo `docker-compose.yml` fornecido para facilitar o processo de criação e execução do contêiner PostgreSQL.

### Conteúdo do docker-compose.yml:

```yaml
version: "3"

services:
  postgres:
    image: "postgres:latest"
    container_name: sql-fundamentals
    environment:
      POSTGRES_USER: "root"
      POSTGRES_PASSWORD: "root"
    ports:
      - "5432:5432"
```

Este arquivo `docker-compose.yml` define um serviço chamado `postgres` que utiliza a imagem `postgres:latest`. Ele define as variáveis de ambiente `POSTGRES_USER` e `POSTGRES_PASSWORD` como "root" para simplificar o processo de configuração. Além disso, mapeia a porta 5432 do host para a porta 5432 do contêiner para permitir o acesso ao PostgreSQL.

Para executar o contêiner usando `docker-compose`, basta navegar até o diretório contendo

### Comando:

```bash
docker exec -it sql-fundamentals bash


### Descrição:

- `docker exec`: Comando para executar um comando dentro de um contêiner em execução.
- `-it`: Opções que permitem interação com o terminal do contêiner.
- `sql-fundamentals`: Nome do contêiner que você deseja acessar.
- `bash`: Comando que você deseja executar dentro do contêiner, neste caso, abre um shell Bash dentro do contêiner.
```

Este comando permite acessar o shell interativo dentro do contêiner `sql-fundamentals`, facilitando a execução de comandos e interação com o ambiente do contêiner.
