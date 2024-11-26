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
    titulo VARCHAR(100) NOT NULL,
    fonte TEXT UNIQUE NOT NULL,
    lead TEXT NOT NULL,
    data_publicacao DATE,
    imagem LONGBLOB,
    CONSTRAINT fk_autor FOREIGN KEY (autor) REFERENCES autores(nome)
);

-- Criação da Tabela "Cargos Scrum"
CREATE TABLE cargos_scrum (
    id SERIAL PRIMARY KEY,
    cargo VARCHAR(50),
    funcao TEXT
);

-- Criação da Tabela "Membros"
CREATE TABLE membros (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo INT,
    email VARCHAR(150) UNIQUE NOT NULL,
    github VARCHAR(100),
    CONSTRAINT fk_cargo FOREIGN KEY (cargo) REFERENCES cargos_scrum(cargo)
);

-- Criação da Tabela "Entrevistados"
CREATE TABLE entrevistados (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cargo_rede_sesi VARCHAR(50),
);

-- Criação da Tabela "Entrevistas"
CREATE TABLE entrevistas (
    id SERIAL PRIMARY KEY,
    CONSTRAINT fk_entrevistado FOREIGN KEY (entrevistado) REFERENCES entrevistados(nome),
    CONSTRAINT fk_entrevistador FOREIGN KEY (entrevistador) REFERENCES membros(nome),
    tempo_de_duracao DECIMAL(4, 2)
);

-- Criação da Tabela "Carreiras"
CREATE TABLE carreiras (
    id_carreira SERIAL PRIMARY KEY,
    cargo_carreira VARCHAR(100),
    estagio VARCHAR(100),
    requisitos_cargo VARCHAR(100)
)

-- Criação da Tabela "Estágios"
CREATE TABLE estagios (
    id_estagio SERIAL PRIMARY KEY,
    cargo_estagio VARCHAR(100),
    empresa VARCHAR(100),
    salario_medio DECIMAL(4,2),
    requisitos_estagio VARCHAR(100),
    carga_horaria INTEGER(2,3)
);

-- Criação da Tabela "Simulados"
CREATE TABLE simulados (
    ID_simulado SERIAL PRIMARY KEY,
    fase_ensino VARCHAR(50),
    numero_questoes INT
);

--------------------------------Inserções de conteúdo--------------------------------

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

-- Inserções na Tabela de "Cargos Scrum"
INSERT INTO cargos_scrum (cargo, funcao)
('Product Owner', 'Responsável por maximizar o valor do produto, gerenciar o backlog do produto e definir prioridades garantindo que a equipe de desenvolvedores entenda claramente os itens do backlog.'),
('Scrum Master', 'Responsável por garantir que a equipe de desenvolvedores siga os princípios e práticas do Srum, removendo impedimentos, facilitando reuniões e promovendo melhorias.'),
('Developers', 'Responsáveis por criar e entregar incrementos de produto de alta qualidade, colaborando para planejar, desenvolver, testar e revisar o trabalho necessário para atingir objetivos do sprint.');

-- Inserções na Tabela de "Membros"
INSERT INTO membros (nome, cargo, email, github)
('Pedro de Oliveira', 1, 'pedro.o.santos7@aluno.senai.br', 'pedro-ols'),
('Vitor Argeri', 2, 'vitor.argeri@aluno.senai.br', 'VitorArgeri'),
('Miguel Sarti', 3, 'miguel.sarti@aluno.senai.br', 'miguelsarti'),
('Raphaelle Lacerda', 3, 'raphaelle.lacerda@aluno.senai.br', 'R4phaLacerda'),
('Sara Souza', 3, 'sara.e.souza9@aluno.senai.br', 's0uzx');

-- Inserções na Tabela de "Entrevistas"
INSERT INTO entrevistas (entrevistado, tempo_de_duracao) VALUES
('Daniela Real', 09.35),
('Ivonete Pereira', 10.13),
('Ana Freire', 07.54);

-- Inserções na Tabela de "Entrevistados"
INSERT INTO entrevistados (nome, cargo) VALUES
('Daniela Real','Professor de Português'),
('Ivonete Pereira', 'Professor de Português'),
('Ana Freire', 'Professor de Português');

-- Inserções na Tabela de "Notícias"
INSERT INTO noticias (autor, titulo, fonte, lead, data_publicacao, imagem) VALUES 
('Miguel Sarti', ' Premiê de Portugal defende que português seja língua oficial da ONU', 'https://veja.abril.com.br/mundo/premie-de-portugal-defende-que-portugues-seja-lingua-oficial-da-onu/
', 'Luis Montenegro abordou Lula e disse que o petista tem carinho pela pauta; Ele também reforçou candidatura de seu país ao Conselho de Segurança.', '2024-09-26', LOAD_FILE()),
('Marília Monitchele', 'Fernando Venâncio: A língua portuguesa não nasceu com os portugueses', 'https://https://veja.abril.com.br/educacao/fernando-venancio-a-lingua-portuguesa-nao-nasceu-com-os-portugues/
-seja-lingua-oficial-da-onu/', 'Linguista português desfaz preconceitos e parte da formação das palavras para falar sobre a construção do idioma', '2024-05-28'),
('Laísa Dall Agnol', 'Prefeitura de São Paulo quer guarani como segunda língua oficial da cidade 
', 'https://veja.abril.com.br/coluna/radar/prefeitura-de-sao-paulo-quer-guarani-como-segunda-lingua-oficial-da-cidade/
', 'O prefeito de São Paulo Ricardo Nunes (MDB) enviou à Câmara Municipal um projeto para tornar a língua guarani o idioma secundário da cidade.', '2021-09-12'),
('Wilson Ledo', 'Novas regras de Portugal para imigrantes geram dúvidas, entenda:', 'https://www.cnnbrasil.com.br/internacional/novas-regras-de-portugal-para-imigrantes-geram-duvidas-entenda/', 'Governo português anunciou plano que dificulta entrada no país; medida exigirá contrato de trabalho e fim das manifestações de interesse', '2024-06-04'),
('Lucas Pordeus León', 'CPLP: entenda o que é a Comunidade dos Países de Língua Portuguesa.', 'https://www.cnnbrasil.com.br/internacional/cplp-entenda-o-que-e-a-comunidade-dos-paises-de-lingua-portuguesa/'
, 'Integram a Comunidade dos Países de Língua Portuguesa (CPLP) países que, ao longo de sua história, foram colonizados pelo antigo Império Português.
', '2023-08-27'),
('Mirella Cordeiro', '4 professores de português para seguir nas redes sociais.', 'https://www.cnnbrasil.com.br/educacao/5-professores-de-portugues-para-seguir-nas-redes-sociais/'
, 'Com bom humor, professores ensinam português nas redes sociais de forma descomplicada.', '2024-09-21'),
('Miguel Sarti', 'Pesquisadores dedicados à linguística africana estudam seu impacto no Brasil de hoje.', 'https://jornal.usp.br/diversidade/pesquisadores-dedicados-a-linguistica-africana-estudam-impacto-no-brasil-de-hoje/'
, 'Simpósio gratuito na USP reúne os primeiros docentes do Brasil a ocuparem cadeiras dedicadas ao estudo da linguística africana no país', '2024-08-26'),
('Miguel Sarti', 'MEC lança estratégia para melhorar alfabetização', 'https://www.soportugues.com.br/secoes/new.php?indice=174'
, 'Após a divulgação dos dados do Censo da Educação Básica 2015, se comprometeu a unir esforços de três programas do governo para garantir a alfabetização do ensino fundamental.', '2016-03-23'),
('Miguel Sarti', 'Como usar o gerúndio corretamente sem virar gerundismo', 'https://exame.com/hub-faculdade-exame/como-usar-o-gerundio-corretamente-sem-virar-gerundismo-2/'
, 'É correto usar o gerúndio quando se quer expressar uma ideia ou ação que ocorre no momento de outra no futuro', '2016-03-23'),
('Miguel Sarti', 'Projeto estudantil estimula aprendizagem da língua portuguesa e exercício da cidadania', 'https://jornal.usp.br/diversidade/projeto-estudantil-estimula-aprendizagem-da-lingua-portuguesa-e-exercicio-da-cidadania/'
, 'Nos dias 10, 11 e 12 agosto, será possível se inscrever no Projeto Redigir, curso que capacita estudantes a desenvolver habilidades de comunicação, além de incentivar o pensamento crítico sobre direitos e deveres sociais.', '2023-08-10'),
('Miguel Sarti', 'Professora da USP Ribeirão oferece curso gratuito de português para imigrantes', 'https://jornal.usp.br/campus-ribeirao-preto/professora-da-usp-ribeirao-oferece-curso-gratuito-de-portugues-para-imigrantes/ua-portuguesa-e-exercicio-da-cidadania/'
, 'As inscrições vão de 1º a 5 de agosto e o curso terá início dia 12 de agosto na Biblioteca Sinhá Junqueira, no centro de Ribeirão Preto.', '2023-07-20'),
('Miguel Sarti', 'Quantos países falam português no mundo além do Brasil?', 'https://exame.com/pop/quantos-paises-falam-portugues-no-mundo-alem-do-brasil-2/'
, 'Junho, dia 10, é o Dia da Língua Portuguesa no Brasil, mas estamos longe de ser o único país a falar a língua', '2023-07-20'),
('Ana Zimmerman', 'Série do Jornal Hoje aborda a língua portuguesa coloquial falada nas ruas', 'https://g1.globo.com/jornal-hoje/noticia/2015/03/serie-do-jornal-hoje-fala-sobre-lingua-coloquial-falada-nas-ruas.html'
, 'A língua que a gente fala aborda a língua falada em conversas espontâneas.
Linguistas defendem que na comunicação falada não existe certo ou errado.', '2015-03-18'),
('Miguel Sarti', 'Estudiosos discutem a língua portuguesa na educação, literatura e comunicação', 'https://www.soportugues.com.br/secoes/new.php?indice=174'
, 'Evento de valorização da língua está recebendo trabalhos acadêmicos até 16 de agosto', '2019-07-30');

-- Inserções na Tabela de "Autores"
INSERT INTO autores (nome, contratante) VALUES
("Miguel Sarti", "SESI-SENAI"),
("Marília Monitchele", "Veja"),
("Laísa Dall'Agnol", "Veja"),
("Wilson Ledo", "CNN"),
("Lucas Pordeus León", "CNN"),
("Mirella Cordeiro", "CNN"),
("Ana Zimmerman", "G1"),
("Camilla Costa", "BBC");

-- Inserções na Tabela de "Simulados"
INSERT INTO simulados (fase_ensino, numero_questoes) VALUES
("Ensino Fundamental 1", "5"),
("Ensino Fundamental 2", "5"),
("Ensino Médio", "15");

--------------------------------Consultas nas Tabelas--------------------------------
