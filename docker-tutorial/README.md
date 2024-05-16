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
