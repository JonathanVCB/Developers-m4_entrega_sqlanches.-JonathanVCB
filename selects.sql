-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)
 SELECT
 pedidos.*, produtos.id, produtos.nome, produtos.tipo, round(produtos.preço:: numeric,2)
	AS preço, produtos.pts_de_lealdade
 FROM 
 pedidos
 JOIN
 produtos_pedidos ON pedidos.id= produtos_pedidos.pedido_id
 JOIN
 produtos ON produtos.id = produtos_pedidos.produto_id;
 
-- 2)
SELECT
produtos.id
FROM
pedidos 
JOIN produtos_pedidos ON pedidos.id = produtos_pedidos.pedido_id
JOIN produtos ON produtos.id = produtos_pedidos.produto_id
WHERE produtos.nome = 'Fritas'

-- 3)
SELECT
clientes.nome
FROM
pedidos 
JOIN produtos_pedidos ON pedidos.id = produtos_pedidos.pedido_id
JOIN produtos ON produtos.id = produtos_pedidos.produto_id
JOIN clientes ON clientes.id = pedidos.cliente_id
WHERE produtos.nome = 'Fritas'

-- 4)
SELECT
sum(round(produtos.preço:: numeric,2)
	) 
FROM
pedidos 
JOIN  clientes ON pedidos.cliente_id = clientes.id
JOIN  produtos_pedidos pp ON pp.pedido_id = pedidos.id
JOIN produtos ON produtos.id = pp.produto_id
WHERE clientes.nome = 'Laura'

-- 5)
SELECT
produtos.nome, count(produtos.nome) 
FROM
produtos
JOIN produtos_pedidos pp ON pp.produto_id = produtos.id
GROUP  BY produtos.nome
ORDER BY produtos.nome

