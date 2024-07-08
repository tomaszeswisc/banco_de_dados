-- Criação do Banco de Dados mini_mercado
CREATE DATABASE mini_mercado;
USE mini_mercado;

-- Tabela Produtos

CREATE TABLE produtos (id INT AUTO_INCREMENT PRIMARY KEY, nome VARCHAR(100), descricao TEXT, preco DECIMAL(10, 2), quantidade INT, data_validade DATE, categoria VARCHAR(50));

-- Tabela Clientes
CREATE TABLE clientes (id INT AUTO_INCREMENT PRIMARY KEY, nome VARCHAR(100),
email VARCHAR(100), telefone VARCHAR(20), endereco VARCHAR(255));

-- Tabela Fornecedores
CREATE TABLE fornecedores ( id INT AUTO_INCREMENT PRIMARY KEY, nome_empresa VARCHAR(100), nome_contato VARCHAR(100), telefone VARCHAR(20), email VARCHAR(100), endereco VARCHAR(255));

-- Tabela Funcionários
CREATE TABLE funcionarios ( id INT AUTO_INCREMENT PRIMARY KEY, nome VARCHAR(100), email VARCHAR(100), telefone VARCHAR(20), cargo VARCHAR(50));

-- Tabela Vendas
CREATE TABLE vendas ( id INT AUTO_INCREMENT PRIMARY KEY,  data_venda DATE, cliente_id INT, funcionario_id INT, valor_total DECIMAL(10, 2), FOREIGN KEY (cliente_id) REFERENCES clientes(id), FOREIGN KEY (funcionario_id) REFERENCES funcionarios(id) );

-- Tabela Itens de Venda
CREATE TABLE itens_venda ( id INT AUTO_INCREMENT PRIMARY KEY, venda_id INT, produto_id INT, quantidade INT, preco_venda DECIMAL(10, 2), FOREIGN KEY (venda_id) REFERENCES vendas(id), FOREIGN KEY (produto_id) REFERENCES produtos(id));

-- Inserir Produtos
INSERT INTO produtos (nome, descricao, preco, quantidade, data_validade, categoria) VALUES ('Arroz', 'Arroz Branco Tipo 1', 20.00, 50, '2024-12-31', 'Alimentos'), ('Feijão', 'Feijão Carioca', 10.00, 30, '2024-11-30', 'Alimentos');

-- Inserir Clientes
INSERT INTO clientes (nome, email, telefone, endereco) VALUES ('João Silva', 'joao.silva@example.com', '1234-5678', 'Rua A, 123'), ('Maria Oliveira', 'maria.oliveira@example.com', '8765-4321', 'Rua B, 456');

-- Inserir Fornecedores
INSERT INTO fornecedores (nome_empresa, nome_contato, telefone, email, endereco) VALUES ('Fornecedor A', 'Carlos Santos', '1111-2222', 'carlos.santos@fornecedora.com', 'Avenida X, 789'), ('Fornecedor B', 'Ana Lima', '3333-4444', 'ana.lima@fornecedorb.com', 'Avenida Y, 1011');

-- Inserir Funcionários
INSERT INTO funcionarios (nome, email, telefone, cargo) VALUES ('Paulo Souza', 'paulo.souza@example.com', '5555-6666', 'Caixa'), ('Fernanda Alves', 'fernanda.alves@example.com', '7777-8888', 'Gerente');

-- Inserir Vendas e Itens de Venda
INSERT INTO vendas (data_venda, cliente_id, funcionario_id, valor_total) VALUES ('2024-06-18', 1, 1, 30.00);
INSERT INTO itens_venda (venda_id, produto_id, quantidade, preco_venda) VALUES (1, 1, 1, 20.00), (1, 2, 1, 10.00);


