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
    cpf VARCHAR (9),
    PRIMARY KEY (codCliente)
);

CREATE TABLE Vendedor(
    codVendedor INT NOT NULL,
    nome VARCHAR (100) NOT NULL, 
    rg VARCHAR (10) NOT NULL,
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
