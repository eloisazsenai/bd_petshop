-- Usar o banco de dados da loja PET
USE LojaPetVirtual;

-- 1. Inserir Categorias (10 registros)
INSERT INTO categoria (nome_categoria, descricao) VALUES 
('Alimentação', 'Rações secas, úmidas e petiscos para pets'),
('Brinquedos', 'Brinquedos interativos, bolinhas e arranhadores'),
('Acessórios', 'Coleiras, guias, roupas e comedouros'),
('Higiene', 'Shampoos, condicionadores e tapetes higiênicos'),
('Saúde', 'Antipulgas, carrapaticidas e vitaminas'),
('Caminhas', 'Camas, colchonetes e mantas aconchegantes'),
('Caixas de Transporte', 'Caixas e bolsas para transporte seguro'),
('Produtos Orgânicos', 'Alimentos e cosméticos 100% naturais'),
('Aquariofilia', 'Ração e enfeites para peixes e aquários'),
('Aves e Roedores', 'Alimentação e acessórios específicos para aves e roedores');

-- 2. Inserir Clientes (10 registros)
INSERT INTO cliente (nome, sobrenome, cpf, telefone, email, data_nascimento, sexo, senha, status) VALUES 
('Ana', 'Silva', '111.222.333-44', '(79) 98888-1111', 'ana.silva@email.com', '1990-05-12', 'F', 'senha123', 'ATIVO'),
('Bruno', 'Santos', '222.333.444-55', '(79) 98888-2222', 'bruno.santos@email.com', '1985-08-20', 'M', 'senha123', 'ATIVO'),
('Carla', 'Oliveira', '333.444.555-66', '(79) 98888-3333', 'carla.oliveira@email.com', '1992-12-01', 'F', 'senha123', 'ATIVO'),
('Daniel', 'Costa', '444.555.666-77', '(79) 98888-4444', 'daniel.costa@email.com', '1988-03-15', 'M', 'senha123', 'ATIVO'),
('Eduarda', 'Souza', '555.666.777-88', '(79) 98888-5555', 'eduarda.souza@email.com', '1995-07-22', 'F', 'senha123', 'ATIVO'),
('Felipe', 'Lima', '666.777.888-99', '(79) 98888-6666', 'felipe.lima@email.com', '1982-11-10', 'M', 'senha123', 'ATIVO'),
('Gabriela', 'Alves', '777.888.999-00', '(79) 98888-7777', 'gabriela.alves@email.com', '1998-01-30', 'F', 'senha123', 'INATIVO'),
('Lucas', 'Pereira', '888.999.000-11', '(79) 98888-8888', 'lucas.pereira@email.com', '1991-09-05', 'M', 'senha123', 'ATIVO'),
('Mariana', 'Ribeiro', '999.000.111-22', '(79) 98888-9999', 'mariana.ribeiro@email.com', '1987-04-18', 'F', 'senha123', 'ATIVO'),
('Rafael', 'Martins', '000.111.222-33', '(79) 98888-0000', 'rafael.martins@email.com', '1993-06-25', 'M', 'senha123', 'ATIVO');

-- 3. Inserir Endereços (10 registros)
INSERT INTO endereco (cep, logradouro, numero, complemento, bairro, cidade, estado) VALUES 
('49000-001', 'Avenida Beira Mar', '100', 'Apto 102', 'Treze de Julho', 'Aracaju', 'SE'),
('49000-002', 'Rua Desembargador Maynard', '500', 'Casa', 'Getúlio Vargas', 'Aracaju', 'SE'),
('49000-003', 'Rua Estância', '1200', 'Bloco B', 'Centro', 'Aracaju', 'SE'),
('49010-000', 'Avenida Ivo nascimento', '300', NULL, 'Siqueira Campos', 'Aracaju', 'SE'),
('49020-000', 'Rua Pacatuba', '45', NULL, 'Centro', 'Aracaju', 'SE'),
('49100-000', 'Avenida João Rodrigues', '890', 'Condomínio', 'Industrial', 'Aracaju', 'SE'),
('49200-000', 'Rua São Cristóvão', '12', NULL, 'Centro', 'São Cristóvão', 'SE'),
('49300-000', 'Praça da Matriz', '78', NULL, 'Centro', 'Laranjeiras', 'SE'),
('49400-000', 'Rodovia Itabaiana', '1000', 'Km 2', 'Zona Rural', 'Itabaiana', 'SE'),
('49500-000', 'Avenida Augusto Franco', '2500', 'Apto 504', 'Salgado Filho', 'Aracaju', 'SE');

-- 4. Inserir Relacionamento Cliente_Endereço (10 registros)
INSERT INTO cliente_endereco (id_cliente, id_endereco) VALUES 
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10);

-- 5. Inserir Produtos (10 registros)
INSERT INTO produto (descricao, unidade_medida, valor_unitario, imagem, id_categoria) VALUES 
('Ração Premium Cães Adultos 10kg', 'kg', 120.50, 'racao_caes.jpg', 1),
('Ração Gatos Castrados 5kg', 'kg', 89.90, 'racao_gatos.jpg', 1),
('Brinquedo Mordedor Osso de Borracha', 'unidade', 25.00, 'osso.jpg', 2),
('Arranhador para Gatos com Sisal', 'unidade', 150.00, 'arranhador.jpg', 2),
('Coleira Ajustável com Guia', 'unidade', 45.00, 'coleira.jpg', 3),
('Shampoo Antipulgas 500ml', 'ml', 35.50, 'shampoo.jpg', 4),
('Tapete Higiênico Pacote com 30 unidades', 'unidade', 59.90, 'tapete.jpg', 4),
('Antipulgas Spot-on Cães 10-20kg', 'unidade', 75.00, 'antipulgas.jpg', 5),
('Caminha Estampada Grande', 'unidade', 110.00, 'caminha.jpg', 6),
('Caixa de Transporte N° 2', 'unidade', 130.00, 'caixa_transporte.jpg', 7);

-- 6. Inserir Pedidos (10 registros)
INSERT INTO pedido (data_compra, valor_frete, id_cliente, id_endereco) VALUES 
(NOW(), 15.00, 1, 1),
(NOW(), 12.50, 2, 2),
(NOW(), 20.00, 3, 3),
(NOW(), 10.00, 4, 4),
(NOW(), 18.00, 5, 5),
(NOW(), 15.00, 6, 6),
(NOW(), 25.00, 7, 7),
(NOW(), 22.00, 8, 8),
(NOW(), 30.00, 9, 9),
(NOW(), 14.00, 10, 10);

-- 7. Inserir Itens do Pedido (10 registros)
INSERT INTO item_pedido (id_pedido, id_produto, quantidade, valor_unitario) VALUES 
(1, 1, 1, 120.50),
(1, 3, 2, 25.00),
(2, 2, 1, 89.90),
(3, 4, 1, 150.00),
(4, 5, 2, 45.00),
(5, 6, 1, 35.50),
(6, 7, 1, 59.90),
(7, 8, 2, 75.00),
(8, 9, 1, 110.00),
(9, 10, 1, 130.00);