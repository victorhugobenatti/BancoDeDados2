-- Atividade 1

-- Exercício 1:

CREATE DATABASE Lojinha;

CREATE TABLE TipoProduto(
    codTipo INT NOT NULL,
    descricao VARCHAR (255),
    PRIMARY KEY (codTipo)
);

CREATE TABLE Produto(
    codPro INT NOT NULL,
    descricao VARCHAR (255),
    preco DECIMAL (10,2),
    codTipo INT NOT NULL,
    PRIMARY KEY (codPro),
    FOREIGN KEY (codTipo) REFERENCES TipoProduto(codTipo)
);

CREATE TABLE Cliente(
    codCliente INT NOT NULL,
    nome VARCHAR (100) NOT NULL,
    cpf VARCHAR (14) UNIQUE NOT NULL,
    PRIMARY KEY (codCliente)
);

CREATE TABLE Vendedor(
    codVendedor INT NOT NULL,
    nome VARCHAR (100) NOT NULL, 
    rg VARCHAR (10) UNIQUE NOT NULL,
    salario DECIMAL (10,2) NOT NULL,
    PRIMARY KEY (codVendedor)
);

CREATE TABLE Venda(
    numero INT NOT NULL,
    data DATE NOT NULL,
    valorFrete DECIMAL (10,2) NOT NULL,
    PRIMARY KEY (numero)
);

CREATE TABLE VendaProduto(
    numero INT NOT NULL,
    codPro INT NOT NULL,
    PRIMARY KEY (numero, codPro),
    FOREIGN KEY (numero) REFERENCES Venda(numero),
    FOREIGN KEY (codPro) REFERENCES Produto(codPro)
);


-- Exercício 2:

ALTER TABLE Venda
ADD codVendedor INT NOT NULL,
ADD codCliente INT NOT NULL;


-- Exercício 3:

ALTER TABLE Venda
ADD FOREIGN KEY (codVendedor) REFERENCES Vendedor(codVendedor),
ADD FOREIGN KEY (codCliente) REFERENCES Cliente(codCliente);


-- Exercício 4:

ALTER TABLE Produto
ADD unidade INT NOT NULL;


-- Exercício 5:

ALTER TABLE Cliente
ADD telefone VARCHAR (15),
ADD endereco VARCHAR (200),
ADD email VARCHAR (100);


-- Exercício 6:

ALTER TABLE VendaProduto
ADD quantidade INT NOT NULL,
ADD precoUnitario DECIMAL (10,2) NOT NULL;


-- Exercício 7:

SELECT CONSTRAINT_NAME, COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'TipoProduto' AND CONSTRAINT_NAME = 'PRIMARY';

SELECT CONSTRAINT_NAME, COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'Produto' AND CONSTRAINT_NAME = 'PRIMARY';

SELECT CONSTRAINT_NAME, COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'Cliente' AND CONSTRAINT_NAME = 'PRIMARY';

SELECT CONSTRAINT_NAME, COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'Vendedor' AND CONSTRAINT_NAME = 'PRIMARY';

SELECT CONSTRAINT_NAME, COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'Venda' AND CONSTRAINT_NAME = 'PRIMARY';

SELECT CONSTRAINT_NAME, COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'VendaProduto' AND CONSTRAINT_NAME = 'PRIMARY';

-- Exercício 8:

INSERT INTO TipoProduto(codtipo, descricao) VALUES (1, 'Processador');
INSERT INTO Produto(codpro, descricao, preco, codtipo, unidade) VALUES (1, 'Ryzen 3 3200G', 549.90, 1, 1);
INSERT INTO Produto(codpro, descricao, preco, codtipo, unidade) VALUES (2, 'Ryzen 5 5600', 879.90, 1, 1);
INSERT INTO Cliente(codcliente, nome, cpf, telefone, endereco, email) VALUES (1, 'Victor Hugo Benatti', '999.999.999-99', '(62) 99785-1010', 'Av. 85', 'cliente@gmail.com');
INSERT INTO Vendedor(codvendedor, nome, rg, salario) VALUES (1, 'Vendedor Amigo', '99.999-99', 2500.00);
INSERT INTO Venda(numero, data, valorfrete, codvendedor, codcliente) VALUES (1, '2023-10-03', 50.00, 1, 1);
INSERT INTO VendaProduto(numero, codpro, quantidade, precounitario) VALUES (1, 2, 5, 879.90);