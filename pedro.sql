CREATE TABLE autores (
    ID_autor SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    contratante VARCHAR(50)
);

INSERT INTO autores (nome, contratante) VALUES
("Miguel Sarti", "SESI-SENAI"),
("Marília Monitchele", "Veja"),
("Laísa Dall'Agnol", "Veja"),
("Wilson Ledo", "CNN"),
("Lucas Pordeus León", "CNN"),
("Mirella Cordeiro", "CNN"),
("Ana Zimmerman", "G1"),
("Camilla Costa", "BBC");



CREATE TABLE simulados (
    ID_simulado SERIAL PRIMARY KEY,
    fase_ensino VARCHAR(50),
    numero_questoes INT
);

INSERT INTO simulados (fase_ensino, numero_questoes) VALUES
("Ensino Fundamental 1", "5"),
("Ensino Fundamental 2", "5"),
("Ensino Médio", "15");