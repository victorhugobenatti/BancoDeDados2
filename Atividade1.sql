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
    FOREIGN KEY numero REFERENCES Venda(numero),
    FOREIGN KEY codPro REFERENCES Produto(codPro)
);


-- Exercício 2:

ALTER TABLE Venda
ADD codVendedor INT NOT NULL,
ADD codCliente INT NOT NULL;


-- Exercício 3:

ALTER TABLE Venda
ADD FOREIGN KEY codVendedor REFERENCES Vendedor(codVendedor),
ADD FOREIGN KEY codCliente REFERENCES Cliente(codCliente);


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



-- Exercício 8:

INSERT INTO TipoProduto VALUES (1, "Processador");
INSERT INTO Produto VALUES (1, "Ryzen 3 3200G", 549,90, 1);
INSERT INTO Produto VALUES (2, "Ryzen 5 5600", 879,90, 1, 1);
INSERT INTO Cliente VALUES (1, "Victor Hugo Benatti", "999.999.999-99", "(62) 99785-1010", "Av. 85", "cliente@gmail.com");
INSERT INTO Vendedor VALUES (1, "Vendedor Amigo", "99.999-99", 2500,00);
INSERT INTO Venda VALUES (1, 2023-10-03, 50,00, 1, 1);
INSERT INTO VendaProduto VALUES (1, 2, 5, 879,90);