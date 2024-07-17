CREATE DATABASE db_join;

USE db_join;

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    Data_Nascimento DATE,
    Estado_Civil CHAR(1),
    Sexo CHAR(1),
    Cidade VARCHAR(100),
    idade INT
);


INSERT INTO clientes (nome, Data_Nascimento, Estado_Civil, Sexo, Cidade, idade) VALUES
('João', '1988-01-03', 'S', 'M', 'São Paulo', 36),
('Maria', '1990-02-14', 'C', 'F', 'Rio de Janeiro', 34),
('Carlos', '1988-01-03', 'S', 'M', 'São Paulo', 36),
('Ana', '1995-06-21', 'S', 'F', 'Salvador', 28),
('Pedro', '1988-01-03', 'C', 'M', 'São Paulo', 36);


CREATE TABLE pedidos (
 id INT AUTO_INCREMENT PRIMARY KEY,
 cliente_id INT,
 produto VARCHAR(100),
 quantidade INT,
 FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);


INSERT INTO pedidos (cliente_id, produto, quantidade) VALUES
(1, 'Produto A', 10),
(2, 'Produto B', 5),
(1, 'Produto C', 2);

CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10, 2)
);

INSERT INTO produtos (nome, preco) VALUES
('Produto A', 100.50),
('Produto B', 200.00),
('Produto C', 150.75);

CREATE TABLE estoque (
    produto_id INT,
    quantidade_disponivel INT,
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

INSERT INTO estoque (produto_id, quantidade_disponivel) VALUES
(1, 50),
(2, 20),
(3, 10);

-- INNER JOIN

SELECT clientes.nome, pedidos.produto, pedidos.quantidade
FROM clientes
INNER JOIN pedidos 
ON clientes.id = pedidos.cliente_id;

-- LEFT JOIN

SELECT clientes.nome, pedidos.produto, pedidos.quantidade
FROM clientes
LEFT JOIN pedidos 
ON clientes.id = pedidos.cliente_id;

-- RIGHT JOIN

SELECT produtos.nome, estoque.quantidade_disponivel
FROM produtos
RIGHT JOIN estoque 
ON produtos.id = estoque.produto_id;


-- FULL JOIN ou FULL OUTER JOIN

SELECT clientes.nome, pedidos.produto, pedidos.quantidade
FROM clientes
LEFT JOIN pedidos 
ON clientes.id = pedidos.cliente_id

UNION

SELECT clientes.nome, pedidos.produto, pedidos.quantidade
FROM clientes
RIGHT JOIN pedidos 
ON clientes.id = pedidos.cliente_id;
