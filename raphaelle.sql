CREATE DATABASE portal_de_materias;
\c portal_de_materias;


CREATE TABLE entrevistas (
    id SERIAL PRIMARY KEY,
    entrevistado VARCHAR(150) NOT NULL,
    tempo_de_duracao INT,
);

SELECT * FROM entrevistas;

INSERT INTO entrevistas (entrevistado, tempo_de_duracao) VALUES
('', ''),
;


CREATE TABLE entrevistados (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cargo VARCHAR (100) NOT NULL,
);

SELECT * FROM entrevistados;

INSERT INTO entrevistados (nome, cargo) VALUES
('',''),
;


CREATE TABLE cargos_scrum (
    id SERIAL PRIMARY KEY,
    cargo VARCHAR(100),
    funcao VARCHAR(150),
);

SELECT * FROM cargos_scrum;

INSERT INTO cargos_scrum (cargo, funcao)
('', ''),
;
