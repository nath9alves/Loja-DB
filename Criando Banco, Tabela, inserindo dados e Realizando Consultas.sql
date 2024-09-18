
--CREATE DATABASE LojaDB;

----------------------------------> Banco criado

--USE LojaDB;
---- Criando a tabela Clientes que armazena os dados dos clientes
--CREATE TABLE Clientes (
--    ClienteID INT PRIMARY KEY,  -- ClienteID � a chave prim�ria, ou seja, identifica unicamente cada cliente
--    NomeCliente VARCHAR(100),   -- Nome do cliente, armazenado como uma string de at� 100 caracteres
--    Cidade VARCHAR(50)          -- Cidade onde o cliente mora, armazenado como uma string de at� 50 caracteres
--);


-- Criando a tabela Pedidos que armazena os pedidos feitos pelos clientes

--CREATE TABLE Pedidos (
--    PedidoID INT PRIMARY KEY,   -- PedidoID � a chave prim�ria, identificando unicamente cada pedido
--    ClienteID INT,              -- ClienteID � uma chave estrangeira, associando cada pedido a um cliente
--    DataPedido DATE,            -- Data do pedido, armazenada como um valor de data
--    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)  -- ClienteID � uma chave estrangeira que referencia a chave prim�ria da tabela Clientes
--);


-- Criando a tabela Produtos que armazena os dados dos produtos dispon�veis

--CREATE TABLE Produtos (
--    ProdutoID INT PRIMARY KEY,  -- ProdutoID � a chave prim�ria, identificando unicamente cada produto
--    NomeProduto VARCHAR(100),   -- Nome do produto
--    CategoriaID INT,            -- CategoriaID � uma chave estrangeira que referencia a tabela Categorias
--    Preco DECIMAL(10, 2)        -- Pre�o do produto, com at� 10 d�gitos no total e 2 casas decimais
--);



-- Criando a tabela Categorias que armazena as categorias dos produtos

--CREATE TABLE Categorias (
--    CategoriaID INT PRIMARY KEY,  -- CategoriaID � a chave prim�ria, identificando unicamente cada categoria
--    NomeCategoria VARCHAR(100)    -- Nome da categoria
--);


-- Inserindo clientes na tabela Clientes

--INSERT INTO Clientes (ClienteID, NomeCliente, Cidade) VALUES
--(1, 'Maria Silva', 'S�o Paulo'),  -- Cliente com ID 1
--(2, 'Jo�o Santos', 'Rio de Janeiro'),  -- Cliente com ID 2
--(3, 'Ana Costa', 'Belo Horizonte');  -- Cliente com ID 3


-- Inserindo pedidos na tabela Pedidos

--INSERT INTO Pedidos (PedidoID, ClienteID, DataPedido) VALUES
--(1, 1, '2024-01-15'),  -- Pedido ID 1 feito pelo cliente com ID 1 (Maria Silva)
--(2, 2, '2024-01-20'),  -- Pedido ID 2 feito pelo cliente com ID 2 (Jo�o Santos)
--(3, 1, '2024-02-10');  -- Pedido ID 3 feito pelo cliente com ID 1 (Maria Silva)



-- Inserindo categorias na tabela Categorias

--INSERT INTO Categorias (CategoriaID, NomeCategoria) VALUES
--(1, 'Eletr�nicos'),  -- Categoria com ID 1
--(2, 'Vestu�rio');    -- Categoria com ID 2



---- Inserindo produtos na tabela Produtos

--INSERT INTO Produtos (ProdutoID, NomeProduto, CategoriaID, Preco) VALUES
--(1, 'Celular', 1, 1500.00),     -- Produto Celular, pertence � categoria Eletr�nicos
--(2, 'Televis�o', 1, 3000.00),   -- Produto Televis�o, pertence � categoria Eletr�nicos
--(3, 'Camiseta', 2, 50.00);      -- Produto Camiseta, pertence � categoria Vestu�rio


---------------------------------->  Criado Tabelas e Colunas


-- Exibindo o nome dos clientes e as datas dos pedidos que eles fizeram

--SELECT Clientes.NomeCliente, Pedidos.DataPedido
--FROM Clientes
--INNER JOIN Pedidos ON Clientes.ClienteID = Pedidos.ClienteID;


-- Exibindo o nome dos clientes e as datas dos pedidos (se houver), incluindo clientes que ainda n�o fizeram pedidos

--SELECT Clientes.NomeCliente, Pedidos.DataPedido
--FROM Clientes
--LEFT JOIN Pedidos ON Clientes.ClienteID = Pedidos.ClienteID;


-- Exibindo o nome dos clientes, as datas dos pedidos, os produtos comprados e suas categorias

--SELECT Clientes.NomeCliente, Pedidos.DataPedido, Produtos.NomeProduto, Categorias.NomeCategoria
--FROM Pedidos
--INNER JOIN Clientes ON Pedidos.ClienteID = Clientes.ClienteID
--INNER JOIN Produtos ON Produtos.ProdutoID = Pedidos.PedidoID
--INNER JOIN Categorias ON Produtos.CategoriaID = Categorias.CategoriaID;


---------------------------------->  Consultando em JOIN



-- Selecionando o nome dos clientes que est�o na tabela Clientes

--SELECT NomeCliente FROM Clientes
--UNION

---- Selecionando o nome dos clientes que fizeram pedidos (ligados pelo ClienteID)

--SELECT Clientes.NomeCliente
--FROM Pedidos
--INNER JOIN Clientes ON Pedidos.ClienteID = Clientes.ClienteID;



-- Selecionando o nome dos clientes que est�o na tabela Clientes

--SELECT NomeCliente FROM Clientes
--UNION ALL

---- Selecionando o nome dos clientes que fizeram pedidos

--SELECT Clientes.NomeCliente
--FROM Pedidos
--INNER JOIN Clientes ON Pedidos.ClienteID = Clientes.ClienteID;










