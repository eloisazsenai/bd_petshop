CREATE DATABASE IF NOT EXISTS LojaPetVirtual;
USE LojaPetVirtual;

-- Tabela Cliente
CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(80) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    sexo CHAR(1),
    senha VARCHAR(255) NOT NULL,
    status ENUM('ATIVO', 'INATIVO') DEFAULT 'ATIVO'
);

-- Tabela Endereço
CREATE TABLE endereco (
    id_endereco INT AUTO_INCREMENT PRIMARY KEY,
    cep VARCHAR(10) NOT NULL,
    logradouro VARCHAR(150) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    complemento VARCHAR(50),
    bairro VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado CHAR(2) NOT NULL
);

-- Tabela Associativa Cliente_Endereço (N:N)
CREATE TABLE cliente_endereco (
    id_cliente INT,
    id_endereco INT,
    PRIMARY KEY (id_cliente, id_endereco),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente) ON DELETE CASCADE,
    FOREIGN KEY (id_endereco) REFERENCES endereco(id_endereco) ON DELETE CASCADE
);

-- Tabela Categoria
CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    descricao VARCHAR(255)
);

-- Tabela Produto (3FN: Dados da categoria isolados)
CREATE TABLE produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(150) NOT NULL,
    unidade_medida VARCHAR(20) NOT NULL, 
    valor_unitario DECIMAL(10,2) NOT NULL,
    imagem VARCHAR(255),
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

-- Tabela Pedido
CREATE TABLE pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    data_compra DATETIME DEFAULT CURRENT_TIMESTAMP,
    valor_frete DECIMAL(10,2) NOT NULL,
    id_cliente INT NOT NULL,
    id_endereco INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_endereco) REFERENCES endereco(id_endereco)
);

-- Tabela Associativa Item_Pedido (N:N entre Pedido e Produto)
CREATE TABLE item_pedido (
    id_pedido INT,
    id_produto INT,
    quantidade INT NOT NULL,
    valor_unitario DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_pedido, id_produto),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido) ON DELETE CASCADE,
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);