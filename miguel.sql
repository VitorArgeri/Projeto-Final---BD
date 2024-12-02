-- Criação da Tabela "Estágios"

CREATE TABLE estagios (
    id_estagio SERIAL PRIMARY KEY,
    cargo_estagio VARCHAR(100),
    empresa VARCHAR(100),
    salario_medio DECIMAL(4,2),
    requisitos_estagio VARCHAR(100),
    carga_horaria INTEGER(2,3)
);

-- Criação da Tabela "Carreiras"

CREATE TABLE carreiras (
    id_carreira SERIAL PRIMARY KEY,
    cargo_carreira VARCHAR(100),
    estagio VARCHAR(100),
    requisitos_cargo VARCHAR(100)
)

-- Inserções de conteúdo em Carreiras e Estágios

INSERT INTO carreiras (cargo_carreira, estagio, requisitos_cargo) VALUES
('Professor', 'Pedagogia', 'Formação na área'),
('Escritor', 'Letras', 'Escrever e criar texto de forma correta e criativa.'),
('Juiz', 'Direito', 'Formação na área');

INSERT INTO estagios (cargo_estagio, empresa, salario_medio, requisitos_estagio, carga_horaria) VALUES
('Direito', 'XRM Advocacia', '1838,00', 'Leitura, Boa Escrita e Inteligência Emocional', '3.700'),
('Letras', 'Academia Brasileira de Letras', '1739,51', 'Comunicação, Análise Textual e Escrita', '3.320'),
('Pedagogia', 'Pedagogia para Liberdade', '1706,71', 'Inglês Fluente, Educação, Conhecimento para Ensinar', '3.200'),
('Redação', 'Estagiário de Redação de Conteúdo', '1033,00', 'Graduação, Inglês fluente, Interpretação', '3.700'),