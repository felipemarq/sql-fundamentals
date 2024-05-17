## Comandos SQL e Cláusulas

### Conexão com o Banco de Dados

\c practice_db

### Seleção de Dados

SELECT \* FROM customers;

### Operadores e Cláusulas SQL

Além disso, é importante notar que existem operadores lógicos e cláusulas adicionais que podem ser usados em consultas SQL:

- AND: Utilizado para combinar múltiplas condições, retornando apenas as linhas que atendem a todas as condições especificadas.
- OR: Utilizado para combinar múltiplas condições, retornando as linhas que atendem a pelo menos uma das condições especificadas.
- IN: Utilizado para verificar se um valor está presente em uma lista de valores.
- BETWEEN: Utilizado para selecionar valores dentro de um intervalo especificado, inclusive os limites do intervalo.
- NOT: Utilizado para negar uma condição, retornando as linhas que não atendem à condição especificada.
- IS NULL: Utilizado para verificar se um valor é nulo.
- LIKE: Utilizado para comparar um valor com um padrão de texto usando curingas.
- ILIKE: Similar ao LIKE, mas case-insensitive, ou seja, não faz distinção entre maiúsculas e minúsculas.

### Exemplos de Utilização

WHERE first_name ILIKE '%J%' -- Filtra as linhas onde o ID é maior que 10
ORDER BY first_name DESC -- Ordena os resultados pelo campo "first_name" em ordem decrescente
LIMIT 10 -- Limita o número de resultados a 10
OFFSET 3; -- Desloca o início da seleção de resultados para a quarta linha

### Funções Agregadas

Exemplos de funções agregadas:

- COUNT: Retorna o número de linhas em um conjunto de resultados.
- AVG: Retorna a média dos valores em uma coluna numérica.
- SUM: Retorna a soma dos valores em uma coluna numérica.
- MAX: Retorna o maior valor em uma coluna.
- MIN: Retorna o menor valor em uma coluna.
