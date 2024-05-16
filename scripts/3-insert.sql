-- Este comando conecta ao banco de dados chamado "practice_db"
\c practice_db

-- Este bloco de comentários descreve um conjunto de inserções de dados na tabela "customers", que está comentado e não será executado.

-- Este bloco de código insere dados na tabela "customers" usando um loop e um array de nomes e sobrenomes, gerando e-mails fictícios para cada cliente.
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
