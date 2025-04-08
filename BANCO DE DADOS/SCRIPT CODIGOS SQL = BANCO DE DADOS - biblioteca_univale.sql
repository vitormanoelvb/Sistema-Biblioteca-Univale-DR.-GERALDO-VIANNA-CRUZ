CREATE DATABASE biblioteca_univale;
USE biblioteca_univale;

CREATE TABLE Livros (
    Id INT PRIMARY KEY,
    Titulo VARCHAR(255) NOT NULL,
    Autor VARCHAR(255),
    Ano INT,
    Historia TEXT,
    Disponivel BOOLEAN DEFAULT TRUE
);

CREATE TABLE Alugueis (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    LivroId INT,
    NomeCliente VARCHAR(255),
    CPF VARCHAR(20),
    Telefone VARCHAR(20),
    DataAluguel DATETIME,
    DataDevolucao DATETIME,
    Valor DECIMAL(10,2),
    FOREIGN KEY (LivroId) REFERENCES Livros(Id)
);

CREATE TABLE Retiradas (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    LivroId INT,
    NomeCliente VARCHAR(255),
    CPF VARCHAR(20),
    Telefone VARCHAR(20),
    DataRetirada DATETIME,
    DataDevolucao DATETIME,
    FOREIGN KEY (LivroId) REFERENCES Livros(Id)
);

CREATE TABLE Deletados (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    LivroId INT,
    Titulo VARCHAR(255),
    Motivo TEXT,
    DataExclusao DATETIME
);

ALTER TABLE Livros
ADD COLUMN Categoria VARCHAR(100);

ALTER TABLE Livros
MODIFY COLUMN Autor VARCHAR(255) NOT NULL;

/*INSERIR ALGUNS DADOS COMO TESTE*/
INSERT INTO Livros (Id, Titulo, Autor, Ano, Historia, Disponivel) VALUES
(1, 'Dom Casmurro', 'Machado de Assis', 1899, 'Um clássico que explora ciúmes e ambiguidade.', TRUE),
(2, 'O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 1943, 'Obra poética sobre amizade e infância.', TRUE),
(3, 'Memórias Póstumas de Brás Cubas', 'Machado de Assis', 1881, 'Narrativa crítica e irônica da sociedade.', TRUE),
(4, 'Capitães da Areia', 'Jorge Amado', 1937, 'Meninos de rua em Salvador.', TRUE),
(5, '1984', 'George Orwell', 1949, 'Distopia sobre vigilância totalitária.', TRUE),
(6, 'A Revolução dos Bichos', 'George Orwell', 1945, 'Fábula sobre revolução e corrupção.', TRUE);

INSERT INTO Alugueis (LivroId, NomeCliente, CPF, Telefone, DataAluguel, DataDevolucao, Valor) VALUES
(1, 'João da Silva', '123.456.789-00', '(33) 99999-1111', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 2 DAY, 16.00),
(2, 'Maria Oliveira', '234.567.890-11', '(33) 99999-2222', NOW() - INTERVAL 2 DAY, NOW() + INTERVAL 4 DAY, 19.00);

INSERT INTO Retiradas (LivroId, NomeCliente, CPF, Telefone, DataRetirada, DataDevolucao) VALUES
(3, 'Carlos Pereira', '345.678.901-22', '(33) 99999-3333', NOW() - INTERVAL 1 DAY, NOW() + INTERVAL 1 DAY);

INSERT INTO Deletados (LivroId, Titulo, Motivo, DataExclusao) VALUES
(7, 'Livro Obsoleto', 'Desatualizado para o acervo', NOW());

/*VER TABELAS*/
SHOW TABLES;

/*VER ESTRUTURA (COLUNAS) DW UMA TABELA*/
SHOW COLUMNS FROM Livros;

/*VER INFORMAÇÕES NAS TABELAS*/
SELECT * FROM Livros;
SELECT * FROM Alugueis;
SELECT * FROM Retiradas;
SELECT * FROM Deletados;

SELECT * FROM Livros WHERE Disponivel = TRUE;

SELECT SUM(Valor) AS TotalArrecadado FROM Alugueis;

SELECT * FROM Alugueis WHERE DataDevolucao < NOW();

/*BUSCAR LIVROS DISPONÍVEIS APENAS/*
/*VER O TOTAL ARRECADADO COM ALUQUÉIS/*
/*VER OS LIVROS COM DEVOLUÇÃO ATRASADA/*
