use db_aula_revisao;

-- Consulta por data:
SELECT * FROM clientes WHERE Data_Nascimento = '19880103';

-- ================================================================================
-- Funçoes de Agregação COUNT / COUNT (*) / COUNT (DISTINCT) - SUM - AVG - MIN-MAX


-- Consulta com Operador AND:
SELECT * FROM clientes WHERE Estado_Civil = 'S' AND Sexo = 'M';



-- Consulta com Operador OR:
SELECT * FROM clientes WHERE Estado_Civil = 'S' OR Estado_Civil = 'C';


-- =================================================================================================================
-- Funções de Agregação COUNT / COUNT(*)/ COUNT(DISTINCT) – SUM – AVG – MIN/MAX
-- As Funções de agregação tem como objetivo realizar cálculos no SQL, como: contagem, soma, média, mínimo e máximo


-- COUNT / COUNT(*)/ COUNT(DISTINCT)

-- Contar o número de clientes:
SELECT COUNT(nome) FROM clientes;

-- COUNT – ignora os valores nulos de uma coluna. Por isso o resultado pode mudar dependendo da coluna escolhida.

-- Contar o número total de clientes:
SELECT COUNT(*) AS 'total clientes' FROM clientes;

-- COUNT (*) – Retorna o número total de linhas

-- Contar o número total de clientes:
SELECT COUNT(DISTINCT Cidade) FROM clientes;

-- Consulta avançada para dar o total de sexo e seus respectivos valores em F e M existentes
SELECT
   SUM(CASE WHEN sexo = 'M' THEN 1 ELSE 0 END) AS qtd_masculino,
   SUM(CASE WHEN sexo = 'F' THEN 1 ELSE 0 END) AS qtd_feminino,
   SUM(1) AS qtd_total
FROM
  clientes;


-- ============================================================================================
-- SUM – AVG – MIN/MAX


-- Consultar a soma total das vendas:
SELECT SUM(idade) FROM clientes;

SELECT SUM(idade) AS 'Soma das Idades' FROM clientes;

-- Para retornar de forma mais agradável podemos adicionar um nome a uma coluna temporária com o AS ‘Soma das Idades’

SELECT SUM(idade) AS ‘Soma das Idades’ FROM clientes;


-- Consultar a média de idade dos clientes:
SELECT AVG(idade) FROM clientes;

SELECT AVG(idade) AS 'Média das Idades' FROM clientes;
-- Para retornar de forma mais agradável podemos adicionar um nome a uma coluna temporária com o AS ‘Média das Idades’


-- Consultar a mínima  idade dos clientes:
SELECT MIN(idade) FROM clientes;

SELECT MIN(idade) AS 'Menor das Idades' FROM clientes;

-- Para retornar de forma mais agradável podemos adicionar um nome a uma coluna temporária com o AS ‘Menor das Idades’


-- Consultar a máxima idade dos clientes:
SELECT MAX(idade) FROM clientes;

SELECT MAX(idade) AS 'Maior das Idades' FROM clientes;

SELECT MAX(preco) AS 'Maior Valor dos Produtos' FROM produtos;

-- Para retornar de forma mais agradável podemos adicionar um nome a uma coluna temporária com o AS ‘Maior das Idades’



-- =========================================================================================================================

-- GROUP BY - O Group By é o comando do SQL que vai nos permitir criar agrupamentos, ou seja, tabelas resumos das nossas tabelas principais.
-- SELECT coluna, COUNT(*) FROM tabela GROUP BY coluna;

SELECT Cidade, COUNT(*) AS 'Qtd. Clientes' FROM clientes group by cidade;

SELECT marca, COUNT(*) AS 'Qtd Marcas' FROM produtos group by marca;






