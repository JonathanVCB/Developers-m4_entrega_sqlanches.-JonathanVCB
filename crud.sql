-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)
INSERT INTO clientes
  (nome, lealdade)
VALUES
  ('Georgia', 0);


-- 2)
 INSERT INTO pedidos
    (status, cliente_id)
VALUES
  ('Recebido', 11);


-- 3)
 INSERT INTO produtos_pedidos
  (pedido_id, produto_id)
VALUES
  (6, 1),
  (6, 2),
  (6, 6),
  (6, 8),
    (6, 8);



-- Leitura

-- 1)

  SELECT
clientes.id,
clientes.nome,
clientes.lealdade,
pedidos.id,
pedidos.status,
pedidos.cliente_id,
produtos.id,
produtos.nome,
produtos.tipo,
round(produtos.preço:: numeric,2)
	AS preço,
produtos.pts_de_lealdade
FROM
pedidos 
JOIN  clientes ON pedidos.cliente_id = clientes.id
JOIN  produtos_pedidos pp ON pp.pedido_id = pedidos.id
JOIN produtos ON produtos.id = pp.produto_id
WHERE clientes.nome = 'Georgia'

-- Atualização

-- 1)

UPDATE 
clientes 
SET lealdade = 48
WHERE id = 11
RETURNING  *

-- Deleção

-- 1)
DELETE FROM clientes WHERE id = 4 RETURNING *

