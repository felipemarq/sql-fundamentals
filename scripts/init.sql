DROP DATABASE practice_db;

CREATE DATABASE practice_db;

-- Este comando conecta ao banco de dados chamado "practice_db"
\c practice_db

-- Este comando exclui a tabela "customers" se ela existir
DROP TABLE IF EXISTS customers;


-- Este comando cria a tabela "customers" se ela não existir
CREATE TABLE IF NOT EXISTS customers (
    id SERIAL PRIMARY KEY, -- Cria uma coluna de identificação automática
    first_name VARCHAR(256) NOT NULL, -- Cria uma coluna para o primeiro nome do cliente
    last_name VARCHAR(256) NOT NULL, -- Cria uma coluna para o sobrenome do cliente
    email VARCHAR(256) NOT NULL UNIQUE, -- Cria uma coluna para o e-mail do cliente
    created_at TIMESTAMP DEFAULT NOW() -- Cria uma coluna para armazenar a data e hora de criação, com o valor padrão sendo a data e hora atuais
);

-- Este comando exclui a tabela "orders" se ela existir
DROP TABLE IF EXISTS orders;

-- Este comando cria a tabela "orders" se ela não existir
CREATE TABLE IF NOT EXISTS orders (
    id SERIAL PRIMARY KEY, -- Cria uma coluna de identificação automática
    customer_id INT, -- Cria uma coluna para o ID do cliente relacionado ao pedido
    amount NUMERIC(7,2),
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE ON UPDATE CASCADE-- Cria uma coluna para o valor do pedido, com até 7 dígitos, sendo 2 deles para casas decimais
);

-- Seed DB
DO $$ 
DECLARE
    i INT := 1; -- Declara uma variável inteira i e inicializa com 1
    customer_id INT; -- Declara uma variável inteira para armazenar o ID do cliente
    first_names TEXT[] := ARRAY['John', 'Jane', 'Robert', 'Emily', 'Michael', 'Emma', 'William', 'Olivia', 'David', 'Ava', 'Daniel', 'Sophia', 'James', 'Isabella', 'Joseph', 'Mia', 'Andrew', 'Abigail', 'Matthew', 'Ella']; -- Declara um array de primeiros nomes
    last_names TEXT[] := ARRAY['Smith', 'Johnson', 'Brown', 'Taylor', 'Anderson', 'Thomas', 'Jackson', 'White', 'Harris', 'Martin']; -- Declara um array de sobrenomes
BEGIN
    WHILE i <= 20 LOOP -- Inicia um loop enquanto i for menor ou igual a 20
        -- Insere um novo cliente na tabela "customers" com um nome, sobrenome e e-mail fictícios
        INSERT INTO customers (first_name, last_name, email)
        VALUES (first_names[1 + (i % 20)], last_names[1 + ((i + 3) % 10)], first_names[1 + (i % 20)] || i || '@email.com')
        RETURNING id INTO customer_id; -- Retorna o ID do cliente inserido na variável customer_id
      
        -- Insere um novo pedido na tabela "orders" associado ao cliente recém-inserido, com um valor aleatório
        INSERT INTO orders (customer_id,amount)
        VALUES (customer_id,RANDOM() * 1000 ); -- O valor do pedido é gerado aleatoriamente entre 0 e 1000
      
        i := i + 1; -- Incrementa o valor de i em 1 para prosseguir para o próximo cliente
    END LOOP;

    -- Emite uma mensagem de aviso informando quantos clientes foram criados com sucesso
    RAISE NOTICE '% customers successfully created.', i;
END $$;