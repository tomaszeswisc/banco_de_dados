-- Criação e Inserção dos Dados nas Tabelas Não Normalizadas
-- Tabela clientes com Compras Não Atômicas: Esta tabela viola a Primeira Forma Normal (1FN) porque a coluna compras contém múltiplos valores, o que não é atômico.
create database db_normalizacao;

use db_normalizacao;

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(15),
    compras VARCHAR(255) -- Lista de itens comprados (não atômica)
);


INSERT INTO clientes (nome, telefone, compras) VALUES
('João', '12345678', 'TV, Geladeira'),
('Maria', '87654321', 'Máquina de Lavar');


-- Tabela pedidos com Dependências Parciais: Esta tabela viola a Segunda Forma Normal (2FN) porque o campo nome_cliente depende parcialmente da chave primária cliente_id.

CREATE TABLE pedidos (
    pedido_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    nome_cliente VARCHAR(100), -- Dependência parcial
    data_pedido DATE,
    valor DECIMAL(10, 2)
);


INSERT INTO pedidos (cliente_id, nome_cliente, data_pedido, valor) VALUES
(1, 'João', '2023-01-01', 100.00),
(2, 'Maria', '2023-01-02', 200.00);


-- Tabela produtos com Dependências Transitivas: Esta tabela viola a Terceira Forma Normal (3FN) porque o campo telefone_fornecedor depende do campo fornecedor, que não é uma chave primária.

CREATE TABLE produtos (
    produto_id INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100),
    fornecedor VARCHAR(100),
    telefone_fornecedor VARCHAR(15) -- Dependência transitiva
);


INSERT INTO produtos (nome_produto, fornecedor, telefone_fornecedor) VALUES
('TV', 'LG', '12345678'),
('Geladeira', 'Samsung', '87654321');

-- Normalizando o Banco de dados 1FN

CREATE TABLE clientes_1FN (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(15)
);

CREATE TABLE compras (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    item VARCHAR(100),
    FOREIGN KEY (cliente_id) REFERENCES clientes_1FN(id)
);

-- Inserir dados na nova estrutura

INSERT INTO clientes_1FN (nome, telefone)
SELECT nome, telefone FROM clientes;


INSERT INTO compras (cliente_id, item) VALUES
(1, 'TV'), (1, 'Geladeira'), (2, 'Máquina de Lavar');

-- Excluir a tabela não Normalizada
DROP TABLE clientes;


-- Normalizando o Banco de dados 2FN

CREATE TABLE clientes_2FN (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE pedidos_2FN (
    pedido_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    data_pedido DATE,
    valor DECIMAL(10, 2),
    FOREIGN KEY (cliente_id) REFERENCES clientes_2FN(id)
);

-- Inserir dados na nova estrutura

INSERT INTO clientes_2FN (id, nome) 
SELECT cliente_id, nome_cliente FROM pedidos GROUP BY cliente_id, nome_cliente;

INSERT INTO pedidos_2FN (cliente_id, data_pedido, valor)
SELECT cliente_id, data_pedido, valor FROM pedidos;


-- Inserir dados na nova estrutura

DROP TABLE pedidos;