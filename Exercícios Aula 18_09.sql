--### Exercício 1: Usando `INNER JOIN`

--**Objetivo:** Exibir o nome de todos os clientes que fizeram pedidos, mostrando também o ID do pedido.
--**Instruções:**
--- Utilize a tabela `Clientes` e a tabela `Pedidos`.
--- Exiba o `NomeCliente` e o `PedidoID`.
--**Desafio adicional:** E se você quisesse também ver a data do pedido? Adicione a coluna `DataPedido` no resultado.


--SELECT Clientes.NomeCliente, Pedidos.PedidoID, Pedidos.DataPedido
--FROM Clientes
--INNER JOIN Pedidos ON Clientes.ClienteID = Pedidos.ClienteID

----------------------------------------------------------------------------------------------------------------------

--### Exercício 2: Usando `LEFT JOIN`

--**Objetivo:** Listar todos os clientes, mesmo aqueles que ainda **não fizeram pedidos**, e exibir o número do pedido (se houver).
--**Instruções:**
--- Utilize a tabela `Clientes` e a tabela `Pedidos`.
--- Exiba o `NomeCliente` e o `PedidoID` (coloque `NULL` para clientes sem pedidos).
--**Consulta esperada:**
--**Desafio adicional:** Mostre a cidade dos clientes além do nome.

--SELECT Clientes.NomeCliente, Pedidos.PedidoID, Cidade
--FROM Clientes
--LEFT JOIN Pedidos ON Clientes.ClienteID = Pedidos.ClienteID

----------------------------------------------------------------------------------------------------------------------

--### Exercício 3: Usando `UNION`

--**Objetivo:** Combinar os resultados de todos os clientes que estão na tabela de `Clientes` e aqueles que aparecem na tabela de
--`Pedidos` (clientes que fizeram pelo menos um pedido). Evite duplicatas.
--**Instruções:**
--- Utilize a tabela `Clientes` e a tabela `Pedidos`.
--- Exiba o `NomeCliente` e remova duplicatas.
--**Desafio adicional:** E se você quiser adicionar a cidade dos clientes no resultado? Atualize a consulta para incluir essa informação.

--SELECT NomeCliente, Cidade
--FROM Clientes
--UNION
--SELECT DISTINCT Clientes.NomeCliente, Clientes.Cidade
--FROM Pedidos
--INNER JOIN Clientes ON Pedidos.ClienteID = Clientes.ClienteID;

----------------------------------------------------------------------------------------------------------------------

--### Exercício 4: Usando `UNION ALL`

--**Objetivo:** Combinar os resultados de todos os clientes da tabela `Clientes` e aqueles que fizeram pedidos, mostrando todas as ocorrências, inclusive duplicadas.
--**Instruções:**
--- Utilize a tabela `Clientes` e a tabela `Pedidos`.
--- Exiba o `NomeCliente`, permitindo que apareça mais de uma vez se o cliente fizer múltiplos pedidos.
--**Desafio adicional:** Tente contar quantas vezes cada cliente aparece no resultado final (dica: use `COUNT`).

--SELECT NomeCliente
--FROM Clientes
--UNION ALL
--SELECT Clientes.NomeCliente
--FROM Pedidos
--INNER JOIN Clientes ON Pedidos.ClienteID = Clientes.ClienteID;

--SELECT Nomecliente, COUNT(*) AS TotalOcorrencias
--FROM (
--SELECT Clientes.NomeCliente
--FROM Clientes
--UNION ALL
--SELECT Clientes.NomeCliente
--FROM Pedidos
--INNER JOIN Clientes ON Pedidos.ClienteID = Clientes.ClienteID)
--AS TodosClientes
--GROUP BY NomeCliente

----------------------------------------------------------------------------------------------------------------------

--### Exercício 5: Usando múltiplos joins

--**Objetivo:** Exibir o nome dos clientes, os detalhes dos produtos comprados (nome do produto e quantidade), e a data em que os pedidos foram feitos.
--**Instruções:**
--1. **Crie a tabela `DetalhesPedidos`**, que ainda não existe no banco de dados. Ela deve armazenar as informações de cada produto incluído em um pedido.
--2. Utilize as tabelas `Clientes`, `Pedidos`, `DetalhesPedidos` e `Produtos`.
--3. Exiba `NomeCliente`, `NomeProduto`, `Quantidade`, e `DataPedido`.
--### Passo 1: Criação da tabela `DetalhesPedidos`
--Antes de realizar a consulta, você precisará criar a tabela `DetalhesPedidos`, que contém informações sobre os produtos vendidos em cada pedido.

-- Selecionando o banco de dados para uso

--CREATE TABLE DetalhesPedidos (
--    DetalheID INT PRIMARY KEY IDENTITY(1,1),  -- Identificador único para cada linha
--    PedidoID INT,                             -- Relaciona com a tabela Pedidos
--    ProdutoID INT,                            -- Relaciona com a tabela Produtos
--    Quantidade INT,                           -- Quantidade de produtos no pedido
--    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID),  -- Chave estrangeira para Pedidos
--    FOREIGN KEY (ProdutoID) REFERENCES Produtos(ProdutoID) -- Chave estrangeira para Produtos
----);

---- Inserindo detalhes dos pedidos

--INSERT INTO DetalhesPedidos (PedidoID, ProdutoID, Quantidade)
--VALUES
--(1, 1, 2),  -- Pedido 1 contém 2 unidades do Produto 1
--(1, 2, 1),  -- Pedido 1 contém 1 unidade do Produto 2
--(2, 3, 5),  -- Pedido 2 contém 5 unidades do Produto 3
--(3, 2, 2);  -- Pedido 3 contém 2 unidades do Produto 2


--### Passo 3: Consulta com múltiplos joins

--Agora que a tabela está criada e os dados estão inseridos, você pode realizar a consulta para exibir as informações solicitadas.
--### Explicação:
--- **Clientes.NomeCliente**: O nome do cliente que fez o pedido.
--- **Produtos.NomeProduto**: O nome do produto que o cliente comprou.
--- **DetalhesPedidos.Quantidade**: A quantidade de cada produto comprado.
--- **Pedidos.DataPedido**: A data em que o pedido foi realizado.
--### Desafio adicional:
--Adicione uma cláusula `ORDER BY` para ordenar os resultados pela data do pedido mais recente.
--Com esse exercício, você praticará a criação de tabelas com chaves estrangeiras e o uso de múltiplos `JOINs` para combinar dados de
--várias tabelas relacionadas.

--SELECT 
--Clientes.NomeCliente, 
--Produtos.NomeProduto, 
--DetalhesPedidos.Quantidade, 
--Pedidos.DataPedido

--FROM Clientes

--INNER JOIN Pedidos ON Clientes.ClienteID = Pedidos.ClienteID
--INNER JOIN DetalhesPedidos ON Pedidos.PedidoID = DetalhesPedidos.PedidoID
--INNER JOIN Produtos ON DetalhesPedidos.ProdutoID = Produtos.ProdutoID

--ORDER BY Pedidos.DataPedido DESC

