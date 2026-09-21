-- Usar o banco de dados da loja PET
USE LojaPetVirtual;

-- 5.1. Listar todos os produtos (com suas respectivas categorias)
SELECT 
    p.id_produto, 
    p.descricao, 
    c.nome_categoria AS categoria, 
    p.unidade_medida, 
    p.valor_unitario 
FROM produto p
JOIN categoria c ON p.id_categoria = c.id_categoria;

-- 5.2. Localizar um cliente pelo CPF
SELECT * FROM cliente 
WHERE cpf = '111.222.333-44';

-- 5.3. Listar os clientes de uma determinada cidade (ex: Aracaju)
SELECT DISTINCT c.* 
FROM cliente c
JOIN cliente_endereco ce ON c.id_cliente = ce.id_cliente
JOIN endereco e ON ce.id_endereco = e.id_endereco
WHERE e.cidade = 'Aracaju';

-- 5.4. Alterar o valor de um produto específico
UPDATE produto 
SET valor_unitario = 135.00 
WHERE id_produto = 1;

-- 5.5. Listar todos os pedidos de um determinado cliente, exibindo os produtos adquiridos
SELECT 
    p.id_pedido, 
    p.data_compra, 
    pr.descricao AS produto, 
    ip.quantidade, 
    ip.valor_unitario, 
    (ip.quantidade * ip.valor_unitario) AS subtotal
FROM pedido p
JOIN item_pedido ip ON p.id_pedido = ip.id_pedido
JOIN produto pr ON ip.id_produto = pr.id_produto
WHERE p.id_cliente = 1;

-- 5.6. Listar um determinado pedido, identificando o cliente e todos os produtos relacionados a ele
SELECT 
    p.id_pedido,
    p.data_compra,
    p.valor_frete,
    CONCAT(c.nome, ' ', c.sobrenome) AS nome_cliente,
    c.cpf,
    pr.descricao AS produto,
    ip.quantidade,
    ip.valor_unitario
FROM pedido p
JOIN cliente c ON p.id_cliente = c.id_cliente
JOIN item_pedido ip ON p.id_pedido = ip.id_pedido
JOIN produto pr ON ip.id_produto = pr.id_produto
WHERE p.id_pedido = 1;