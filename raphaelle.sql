--Criação do banco Portal de Matérias
CREATE DATABASE portal_de_materias;
\c portal_de_materias;


--Criação e Insert's da tabela de Cargos Scrum
CREATE TABLE cargos_scrum (
    id SERIAL PRIMARY KEY,
    cargo VARCHAR(50),
    funcao TEXT
);

INSERT INTO cargos_scrum (cargo, funcao)
('Product Owner', 'Responsável por maximizar o valor do produto, gerenciar o backlog do produto e definir prioridades garantindo que a equipe de desenvolvedores entenda claramente os itens do backlog.'),
('Scrum Master', 'Responsável por garantir que a equipe de desenvolvedores siga os princípios e práticas do Srum, removendo impedimentos, facilitando reuniões e promovendo melhorias.'),
('Developers', 'Responsáveis por criar e entregar incrementos de produto de alta qualidade, colaborando para planejar, desenvolver, testar e revisar o trabalho necessário para atingir objetivos do sprint.');

SELECT * FROM cargos_scrum;


--Criação e Insert's da tabela de Membros
CREATE TABLE membros (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo INT,
    email VARCHAR(150) UNIQUE NOT NULL,
    github VARCHAR(100)
    CONSTRAINT fk_cargo FOREIGN KEY (cargo) REFERENCES cargos_scrum(cargo)
);

INSERT INTO membros (nome, cargo, email, github)
('Pedro de Oliveira', 1, 'pedro.o.santos7@aluno.senai.br', 'pedro-ols'),
('Vitor Argeri', 2, 'vitor.argeri@aluno.senai.br', 'VitorArgeri'),
('Miguel Sarti', 3, 'miguel.sarti@aluno.senai.br', 'miguelsarti'),
('Raphaelle Lacerda', 3, 'raphaelle.lacerda@aluno.senai.br', 'R4phaLacerda'),
('Sara Souza', 3, 'sara.e.souza9@aluno.senai.br', 's0uzx');

SELECT * FROM membros;


--Criação e Insert's da tabela de Entrevistas
CREATE TABLE entrevistas (
    id SERIAL PRIMARY KEY,
    entrevistado VARCHAR(150) NOT NULL,
    tempo_de_duracao DECIMAL(4, 2)
);

INSERT INTO entrevistas (entrevistado, tempo_de_duracao) VALUES
('Daniela Real', 09.35),
('Ivonete Pereira', 10.13),
('Ana Freire', 07.54);

SELECT * FROM entrevistas;


--Criação e Insert's da tabela Entrevistados 
CREATE TABLE entrevistados (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cargo_rede_sesi VARCHAR(50),
);

INSERT INTO entrevistados (nome, cargo) VALUES
('Daniela Real','Professor de Português'),
('Ivonete Pereira', 'Professor de Português'),
('Ana Freire', 'Professor de Português');

SELECT * FROM entrevistados;


--------------------------------Consultas nas Tabelas--------------------------------
--Select's na tabela lalalala




--Uptade's na tabela lalalala




--Delete's na tabela lalalala




--------------------------------Funções Agregadas-------------------------------------
--Soma do número de questões dos Simulados (COUNT)
SELECT COUNT(*) AS numero_questoes FROM simulados;

--Média do tempo de duração das Entrevistas (AVG)
SELECT AVG(tempo_de_duracao) AS media_duracao FROM entrevistas;

--Total de membros por cargo dos Cargos Scrum (COUNT)
SELECT cargos_scrum.cargo, COUNT(membros.id) AS total_membros FROM membros
JOIN cargos_scrum 
ON membros.cargo = cargos_scrum.id
GROUP BY cargos_scrum.cargo;
--------------------------------Associações de Tabela (JOIN)--------------------------










