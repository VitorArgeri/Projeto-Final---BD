-- Criação do banco de dados
CREATE DATABASE portal_de_materias;
\c portal_de_materias;

---------------------------------Criação das Tabelas---------------------------------

-- Criação da Tabela "Autores"
CREATE TABLE autores (
    ID_autor SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    contratante VARCHAR(50)
);

-- Criação da Tabela "Notícias"
CREATE TABLE noticias (
    id SERIAL PRIMARY KEY,
    autor INT,
    titulo VARCHAR(500) NOT NULL,
    fonte VARCHAR(500) UNIQUE NOT NULL,
    lead VARCHAR(500) NOT NULL,
    data_publicacao DATE,
    imagem BYTEA,
    CONSTRAINT fk_autor FOREIGN KEY (autor) REFERENCES autores(ID_autor)
);

-- Criação da Tabela "Cargos Scrum"
CREATE TABLE cargos_scrum (
    id SERIAL PRIMARY KEY,
    cargo VARCHAR(50),
    funcao TEXT
);

-- Criação da Tabela "Membros"
CREATE TABLE membros (
    membro_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo INT,
    email VARCHAR(150) UNIQUE NOT NULL,
    github VARCHAR(100),
    CONSTRAINT fk_cargo FOREIGN KEY (cargo) REFERENCES cargos_scrum(id)
);

-- Criação da Tabela "Entrevistados"
CREATE TABLE entrevistados (
    entrevistado_id SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cargo_rede_sesi VARCHAR(50)
);

-- Criação da Tabela "Entrevistas"
CREATE TABLE entrevistas (
    id SERIAL PRIMARY KEY,
    entrevistado INT,
    entrevistador INT,
    tempo_de_duracao DECIMAL(4, 2),
    CONSTRAINT fk_entrevistado FOREIGN KEY (entrevistado) REFERENCES entrevistados(entrevistado_id),
    CONSTRAINT fk_entrevistador FOREIGN KEY (entrevistador) REFERENCES membros(membro_id)
);

-- Criação da Tabela "Estágios"
CREATE TABLE estagios (
    id_estagio SERIAL PRIMARY KEY,
    cargo_estagio VARCHAR(100),
    empresa VARCHAR(100),
    salario_medio DECIMAL(4,2),
    requisitos_estagio VARCHAR(100),
    carga_horaria DECIMAL(2,3)
);

-- Criação da Tabela "Carreiras"
CREATE TABLE carreiras (
    id_carreira SERIAL PRIMARY KEY,
    cargo_carreira VARCHAR(100),
    estagio INT,
    requisitos_cargo VARCHAR(100),
    CONSTRAINT fk_estagio FOREIGN KEY (estagio) REFERENCES estagios(id_estagio)
);

-- Criação da Tabela "Simulados"
CREATE TABLE simulados (
    ID_simulado SERIAL PRIMARY KEY,
    fase_ensino VARCHAR(50),
    numero_questoes INT
);

--------------------------------Inserções de conteúdo--------------------------------

-- Inserções na Tabela de "Autores"
INSERT INTO autores (nome, contratante) VALUES
('Miguel Sarti', 'SESI-SENAI'),
('Marília Monitchele', 'Veja'),
('Laísa Dall´Agnol', 'Veja'),
('Wilson Ledo', 'CNN'),
('Lucas Pordeus León', 'CNN'),
('Mirella Cordeiro', 'CNN'),
('Ana Zimmerman', 'G1'),

-- Inserções na Tabela de "Notícias"
INSERT INTO noticias (autor, titulo, fonte, lead, data_publicacao, imagem) VALUES 
(1, 'Premie de Portugal defende que portugues seja lingua oficial da ONU', 'https://veja.abril.com.br/mundo/premie-de-portugal-defende-que-portugues-seja-lingua-oficial-da-onu/', 'Luis Montenegro abordou Lula e disse que o petista tem carinho pela pauta; Ele tambem reforcou candidatura de seu pais ao Conselho de Seguranca.', '2024-09-26', 'https://lp-projeto.vercel.app/img/noticia-1.png'),
(2, 'Fernando Venancio: A lingua portuguesa nao nasceu com os portugueses', 'https://veja.abril.com.br/educacao/fernando-venancio-a-lingua-portuguesa-nao-nasceu-com-os-portugues/', 'Linguista portugues desfaz preconceitos e parte da formacao das palavras para falar sobre a construcao do idioma', '2024-05-28', 'https://lp-projeto.vercel.app/img/noticia-2.png'),
(3, 'Prefeitura de Sao Paulo quer guarani como segunda lingua oficial da cidade', 'https://veja.abril.com.br/coluna/radar/prefeitura-de-sao-paulo-quer-guarani-como-segunda-lingua-oficial-da-cidade/', 'O prefeito de Sao Paulo Ricardo Nunes (MDB) enviou a Camara Municipal um projeto para tornar a lingua guarani o idioma secundario da cidade.', '2021-09-12', 'https://lp-projeto.vercel.app/img/noticia-3.png'),
(4, 'Novas regras de Portugal para imigrantes geram duvidas, entenda:', 'https://www.cnnbrasil.com.br/internacional/novas-regras-de-portugal-para-imigrantes-geram-duvidas-entenda/', 'Governo portugues anunciou plano que dificulta entrada no pais; medida exigira contrato de trabalho e fim das manifestacoes de interesse', '2024-06-04', 'https://lp-projeto.vercel.app/img/noticia-4.png'),
(5, 'CPLP: entenda o que e a Comunidade dos Paises de Lingua Portuguesa', 'https://www.cnnbrasil.com.br/internacional/cplp-entenda-o-que-e-a-comunidade-dos-paises-de-lingua-portuguesa/', 'Integram a Comunidade dos Paises de Lingua Portuguesa (CPLP) paises que, ao longo de sua historia, foram colonizados pelo antigo Imperio Portugues.', '2023-08-27', 'https://lp-projeto.vercel.app/img/noticia-5.png'),
(6, '4 professores de portugues para seguir nas redes sociais.', 'https://www.cnnbrasil.com.br/educacao/5-professores-de-portugues-para-seguir-nas-redes-sociais/', 'Com bom humor, professores ensinam portugues nas redes sociais de forma descomplicada.', '2024-09-21', 'https://lp-projeto.vercel.app/img/noticia-6.jpeg'),
(1, 'Pesquisadores dedicados a linguistica africana estudam seu impacto no Brasil de hoje.', 'https://jornal.usp.br/diversidade/pesquisadores-dedicados-a-linguistica-africana-estudam-impacto-no-brasil-de-hoje/', 'Simposio gratuito na USP reune os primeiros docentes do Brasil a ocuparem cadeiras dedicadas ao estudo da linguistica africana no pais', '2024-08-26', 'https://lp-projeto.vercel.app/img/noticia-7.png'),
(1, 'MEC lanca estrategia para melhorar alfabetizacao', 'https://www.soportugues.com.br/secoes/new.php?indice=174', 'Apos a divulgacao dos dados do Censo da Educacao Basica 2015, se comprometeu a unir esforcos de tres programas do governo para garantir a alfabetizacao do ensino fundamental.', '2016-03-23', 'https://lp-projeto.vercel.app/img/noticia-8.png'),
(1, 'Como usar o gerundio corretamente sem virar gerundismo', 'https://exame.com/hub-faculdade-exame/como-usar-o-gerundio-corretamente-sem-virar-gerundismo-2/', 'E correto usar o gerundio quando se quer expressar uma ideia ou acao que ocorre no momento de outra no futuro', '2016-03-23', 'https://lp-projeto.vercel.app/img/noticia-9.png'),
(1, 'Projeto estudantil estimula aprendizagem da lingua portuguesa e exercicio da cidadania', 'https://jornal.usp.br/diversidade/projeto-estudantil-estimula-aprendizagem-da-lingua-portuguesa-e-exercicio-da-cidadania/', 'Nos dias 10, 11 e 12 agosto, sera possivel se inscrever no Projeto Redigir, curso que capacita estudantes a desenvolver habilidades de comunicacao, alem de incentivar o pensamento critico sobre direitos e deveres sociais.', '2023-08-10', 'https://lp-projeto.vercel.app/img/noticia-10.png'),
(1, 'Professora da USP Ribeirao oferece curso gratuito de portugues para imigrantes', 'https://jornal.usp.br/campus-ribeirao-preto/professora-da-usp-ribeirao-oferece-curso-gratuito-de-portugues-para-imigrantes/', 'As inscricoes vao de 1 a 5 de agosto e o curso tera inicio dia 12 de agosto na Biblioteca Sinha Junqueira, no centro de Ribeirao Preto.', '2023-07-20', 'https://lp-projeto.vercel.app/img/noticia-11.png'),
(1, 'Quantos paises falam portugues no mundo alem do Brasil?', 'https://exame.com/pop/quantos-paises-falam-portugues-no-mundo-alem-do-brasil-2/', 'Junho, dia 10, e o Dia da Lingua Portuguesa no Brasil, mas estamos longe de ser o unico pais a falar a lingua', '2023-07-20', 'https://lp-projeto.vercel.app/img/noticia-12.png'),
(7, 'Serie do Jornal Hoje aborda a lingua portuguesa coloquial falada nas ruas', 'https://g1.globo.com/jornal-hoje/noticia/2015/03/serie-do-jornal-hoje-fala-sobre-lingua-coloquial-falada-nas-ruas.html', 'A lingua que a gente fala aborda a lingua falada em conversas espontaneas. Linguistas defendem que na comunicacao falada nao existe certo ou errado.', '2015-03-18', 'https://lp-projeto.vercel.app/img/noticia-13.png'),
(8, 'Abismo entre o que falamos e escrevemos pode estar na raiz de muitos erros de portugues, diz linguista', 'https://www.bbc.com/portuguese/articles/crgg1kz9rn4o', 'A lingua que a gente fala aborda a lingua falada em conversas espontaneas. Linguistas defendem que na comunicacao falada nao existe certo ou errado.', '2024-06-13', 'https://lp-projeto.vercel.app/img/noticia-14.png'),
(1, 'Estudiosos discutem a lingua portuguesa na educacao, literatura e comunicacao', 'https://jornal.usp.br/universidade/eventos/estudiosos-discutem-a-lingua-portuguesa-na-educacao-literatura-e-comunicacao/', 'Evento de valorizacao da lingua esta recebendo trabalhos academicos ate 16 de agosto', '2019-07-30', 'https://lp-projeto.vercel.app/img/noticia-15.png');


-- Inserções na Tabela de "Cargos Scrum"
INSERT INTO cargos_scrum (cargo, funcao) VALUES
('Product Owner', 'Responsável por maximizar o valor do produto, gerenciar o backlog do produto e definir prioridades garantindo que a equipe de desenvolvedores entenda claramente os itens do backlog.'),
('Scrum Master', 'Responsável por garantir que a equipe de desenvolvedores siga os princípios e práticas do Srum, removendo impedimentos, facilitando reuniões e promovendo melhorias.'),
('Developers', 'Responsáveis por criar e entregar incrementos de produto de alta qualidade, colaborando para planejar, desenvolver, testar e revisar o trabalho necessário para atingir objetivos do sprint.');

-- Inserções na Tabela de "Membros"
INSERT INTO membros (nome, cargo, email, github) VALUES
('Pedro de Oliveira', 1, 'pedro.o.santos7@aluno.senai.br', 'pedro-ols'),
('Vitor Argeri', 2, 'vitor.argeri@aluno.senai.br', 'VitorArgeri'),
('Miguel Sarti', 3, 'miguel.sarti@aluno.senai.br', 'miguelsarti'),
('Raphaelle Lacerda', 3, 'raphaelle.lacerda@aluno.senai.br', 'R4phaLacerda'),
('Sara Souza', 3, 'sara.e.souza9@aluno.senai.br', 's0uzx');

-- Inserções na Tabela de "Entrevistados"
INSERT INTO entrevistados (nome, cargo_rede_sesi) VALUES
('Daniela Real','Professor de Português'),
('Ivonete Pereira', 'Professor de Português'),
('Ana Freire', 'Professor de Português');

-- Inserções na Tabela de "Entrevistas"
INSERT INTO entrevistas (entrevistado, entrevistador, tempo_de_duracao) VALUES
(1, 1, 09.35),
(2, 1, 10.13),
(3, 1, 07.54);

-- Inserções na Tabela de "Carreiras"
INSERT INTO carreiras (cargo_carreira, estagio, requisitos_cargo) VALUES
('Professor', 'Pedagogia', 'Formação na área'),
('Escritor', 'Letras', 'Escrever e criar texto corretamente e criativa.'),
('Juiz', 'Direito', 'Formação na área');

-- Inserções na Tabela de "Estágios"
INSERT INTO estagios (cargo_estagio, empresa, salario_medio, requisitos_estagio, carga_horaria) VALUES
('Direito', 'XRM Advocacia', '1838,00', 'Leitura, Boa Escrita e Inteligência Emocional', '3.700'),
('Letras', 'Academia Brasileira de Letras', '1739,51', 'Comunicação, Análise Textual e Escrita', '3.320'),
('Pedagogia', 'Pedagogia para Liberdade', '1706,71', 'Inglês Fluente, Educação, Conhecimento para Ensinar', '3.200'),
('Redação', 'Estagiário de Redação de Conteúdo', '1033,00', 'Graduação, Inglês fluente, Interpretação', '3.700'),

-- Inserções na Tabela de "Simulados"
INSERT INTO simulados (fase_ensino, numero_questoes) VALUES
('Ensino Fundamental 1', '5'),
('Ensino Fundamental 2', '5'),
('Ensino Médio', '15');

--------------------------------Consultas nas Tabelas--------------------------------

-- Consulta que o titulo de cada noticia e seu respectivo autor
SELECT N.titulo AS Titulo, A.nome AS Autor
FROM noticias N
JOIN autores A
ON A.ID_autor = N.autor;

-- Consulta que o nome de cada membro da equipe e seus respectivos cargos scrum
SELECT M.nome AS Nome, C.cargo AS Cargo
FROM membros M
JOIN cargos_scrum C
ON M.cargo = C.id;

-- Consulta que retorna o nome do entrevistado, do entrevistador e o tempo de duração da entrevista
SELECT I.nome AS Entrevistado, H.nome AS Entrevistador, E.tempo_de_duracao
FROM entrevistas E
JOIN entrevistados I
ON I.entrevistado_id = E.entrevistado
JOIN membros H
ON H.membro_id = E.entrevistado;

