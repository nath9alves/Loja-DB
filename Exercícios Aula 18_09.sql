--### Exerc�cio 1: Usando `INNER JOIN`

--**Objetivo:** Exibir o nome de todos os clientes que fizeram pedidos, mostrando tamb�m o ID do pedido.
--**Instru��es:**
--- Utilize a tabela `Clientes` e a tabela `Pedidos`.
--- Exiba o `NomeCliente` e o `PedidoID`.
--**Desafio adicional:** E se voc� quisesse tamb�m ver a data do pedido? Adicione a coluna `DataPedido` no resultado.


--SELECT Clientes.NomeCliente, Pedidos.PedidoID, Pedidos.DataPedido
--FROM Clientes
--INNER JOIN Pedidos ON Clientes.ClienteID = Pedidos.ClienteID

----------------------------------------------------------------------------------------------------------------------

--### Exerc�cio 2: Usando `LEFT JOIN`

--**Objetivo:** Listar todos os clientes, mesmo aqueles que ainda **n�o fizeram pedidos**, e exibir o n�mero do pedido (se houver).
--**Instru��es:**
--- Utilize a tabela `Clientes` e a tabela `Pedidos`.
--- Exiba o `NomeCliente` e o `PedidoID` (coloque `NULL` para clientes sem pedidos).
--**Consulta esperada:**
--**Desafio adicional:** Mostre a cidade dos clientes al�m do nome.

--SELECT Clientes.NomeCliente, Pedidos.PedidoID, Cidade
--FROM Clientes
--LEFT JOIN Pedidos ON Clientes.ClienteID = Pedidos.ClienteID

----------------------------------------------------------------------------------------------------------------------

--### Exerc�cio 3: Usando `UNION`

--**Objetivo:** Combinar os resultados de todos os clientes que est�o na tabela de `Clientes` e aqueles que aparecem na tabela de
--`Pedidos` (clientes que fizeram pelo menos um pedido). Evite duplicatas.
--**Instru��es:**
--- Utilize a tabela `Clientes` e a tabela `Pedidos`.
--- Exiba o `NomeCliente` e remova duplicatas.
--**Desafio adicional:** E se voc� quiser adicionar a cidade dos clientes no resultado? Atualize a consulta para incluir essa informa��o.

--SELECT NomeCliente, Cidade
--FROM Clientes
--UNION
--SELECT DISTINCT Clientes.NomeCliente, Clientes.Cidade
--FROM Pedidos
--INNER JOIN Clientes ON Pedidos.ClienteID = Clientes.ClienteID;

----------------------------------------------------------------------------------------------------------------------

--### Exerc�cio 4: Usando `UNION ALL`

--**Objetivo:** Combinar os resultados de todos os clientes da tabela `Clientes` e aqueles que fizeram pedidos, mostrando todas as ocorr�ncias, inclusive duplicadas.
--**Instru��es:**
--- Utilize a tabela `Clientes` e a tabela `Pedidos`.
--- Exiba o `NomeCliente`, permitindo que apare�a mais de uma vez se o cliente fizer m�ltiplos pedidos.
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

--### Exerc�cio 5: Usando m�ltiplos joins

--**Objetivo:** Exibir o nome dos clientes, os detalhes dos produtos comprados (nome do produto e quantidade), e a data em que os pedidos foram feitos.
--**Instru��es:**
--1. **Crie a tabela `DetalhesPedidos`**, que ainda n�o existe no banco de dados. Ela deve armazenar as informa��es de cada produto inclu�do em um pedido.
--2. Utilize as tabelas `Clientes`, `Pedidos`, `DetalhesPedidos` e `Produtos`.
--3. Exiba `NomeCliente`, `NomeProduto`, `Quantidade`, e `DataPedido`.
--### Passo 1: Cria��o da tabela `DetalhesPedidos`
--Antes de realizar a consulta, voc� precisar� criar a tabela `DetalhesPedidos`, que cont�m informa��es sobre os produtos vendidos em cada pedido.

-- Selecionando o banco de dados para uso

--CREATE TABLE DetalhesPedidos (
--    DetalheID INT PRIMARY KEY IDENTITY(1,1),  -- Identificador �nico para cada linha
--    PedidoID INT,                             -- Relaciona com a tabela Pedidos
--    ProdutoID INT,                            -- Relaciona com a tabela Produtos
--    Quantidade INT,                           -- Quantidade de produtos no pedido
--    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID),  -- Chave estrangeira para Pedidos
--    FOREIGN KEY (ProdutoID) REFERENCES Produtos(ProdutoID) -- Chave estrangeira para Produtos
----);

---- Inserindo detalhes dos pedidos

--INSERT INTO DetalhesPedidos (PedidoID, ProdutoID, Quantidade)
--VALUES
--(1, 1, 2),  -- Pedido 1 cont�m 2 unidades do Produto 1
--(1, 2, 1),  -- Pedido 1 cont�m 1 unidade do Produto 2
--(2, 3, 5),  -- Pedido 2 cont�m 5 unidades do Produto 3
--(3, 2, 2);  -- Pedido 3 cont�m 2 unidades do Produto 2


--### Passo 3: Consulta com m�ltiplos joins

--Agora que a tabela est� criada e os dados est�o inseridos, voc� pode realizar a consulta para exibir as informa��es solicitadas.
--### Explica��o:
--- **Clientes.NomeCliente**: O nome do cliente que fez o pedido.
--- **Produtos.NomeProduto**: O nome do produto que o cliente comprou.
--- **DetalhesPedidos.Quantidade**: A quantidade de cada produto comprado.
--- **Pedidos.DataPedido**: A data em que o pedido foi realizado.
--### Desafio adicional:
--Adicione uma cl�usula `ORDER BY` para ordenar os resultados pela data do pedido mais recente.
--Com esse exerc�cio, voc� praticar� a cria��o de tabelas com chaves estrangeiras e o uso de m�ltiplos `JOINs` para combinar dados de
--v�rias tabelas relacionadas.

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

