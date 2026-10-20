DROP DATABASE IF EXISTS tcaph;

CREATE DATABASE tcaph;

CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    endereco VARCHAR(100) NOT NULL
);
CREATE TABLE pedidos(
id SERIAL PRIMARY KEY,
id_cliente INT NOT NULL REFERENCES clientes(id),
data TIMESTAMP NOT NULL,
status VARCHAR(20) NOT NULL,
valor FLOAT NOT NULL
);
CREATE TABLE tamanhos(
    id SERIAL PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL,
    preco_base FLOAT NOT NULL
);
CREATE TABLE bordas(
    id SERIAL PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL,
    preco_adicional FLOAT NOT NULL
);
CREATE TABLE coberturas(
    id SERIAL PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL,
    preco_adicional FLOAT NOT NULL
);
CREATE TABLE bebidas(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    preco_adicional FLOAT NOT NULL,
    tamanho VARCHAR(20) NOT NULL
);
CREATE TABLE condionamentos(
    id SERIAL PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL,
    preco_adicional FLOAT NOT NULL
)
CREATE TABLE itens_pedidos(
    id SERIAL PRIMARY KEY,
    id_pedido INT NOT NULL REFERENCES pedidos(id),
    id_tamanho INT NOT NULL REFERENCES tamanhos(id),
    id_borda INT NOT NULL REFERENCES bordas(id),
    quantidade INT NOT NULL,
    observacao VARCHAR(100) NOT NULL
);
CREATE TABLE itens_coberturas(
    id_item_pedido INT NOT NULL REFERENCES itens_pedidos(id),
    id_cobertura INT NOT NULL REFERENCES coberturas(id)
);
CREATE TABLE itens_bebidas(
    id_item_pedido INT NOT NULL REFERENCES itens_pedidos(id),
    id_bebida INT NOT NULL REFERENCES bebidas(id)
);
CREATE TABLE itens_condionamentos(
    id_item_pedido INT NOT NULL REFERENCES itens_pedidos(id),
    id_condionamento INT NOT NULL REFERENCES condionamentos(id)
);