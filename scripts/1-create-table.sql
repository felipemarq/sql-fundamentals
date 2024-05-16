-- Este comando conecta ao banco de dados chamado "practice_db"
\c practice_db

-- Este comando exclui a tabela "customers" se ela existir
DROP TABLE IF EXISTS customers;

-- Este comando cria a tabela "customers" se ela não existir
CREATE TABLE IF NOT EXISTS customers (
    id SERIAL, -- Cria uma coluna de identificação automática
    first_name VARCHAR(256), -- Cria uma coluna para o primeiro nome do cliente
    last_name VARCHAR(256), -- Cria uma coluna para o sobrenome do cliente
    email VARCHAR(256), -- Cria uma coluna para o e-mail do cliente
    created_at TIMESTAMP DEFAULT NOW() -- Cria uma coluna para armazenar a data e hora de criação, com o valor padrão sendo a data e hora atuais
);

-- Este comando exclui a tabela "orders" se ela existir
DROP TABLE IF EXISTS orders;

-- Este comando cria a tabela "orders" se ela não existir
CREATE TABLE IF NOT EXISTS orders (
    id SERIAL, -- Cria uma coluna de identificação automática
    customer_id INT, -- Cria uma coluna para o ID do cliente relacionado ao pedido
    amount NUMERIC(7,2) -- Cria uma coluna para o valor do pedido, com até 7 dígitos, sendo 2 deles para casas decimais
);
