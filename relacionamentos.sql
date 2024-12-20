
CREATE DATABASE portal_de_materias;
\c portal_de_materias;

CREATE TABLE dicas (
    id_dicas SERIAL PRIMARY KEY,
    titulo_dicas VARCHAR(200),
    descricao_dicas VARCHAR(1000)
);

CREATE TABLE autores (
    ID_autor SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    contratante VARCHAR(50)
);

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

CREATE TABLE cargos_scrum (
    id SERIAL PRIMARY KEY,
    cargo VARCHAR(50),
    funcao TEXT
);

CREATE TABLE membros (
    membro_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo INT,
    email VARCHAR(150) UNIQUE NOT NULL,
    github VARCHAR(100),
    CONSTRAINT fk_cargo FOREIGN KEY (cargo) REFERENCES cargos_scrum(id)
);

CREATE TABLE entrevistados (
    entrevistado_id SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cargo_rede_sesi VARCHAR(50)
);

CREATE TABLE entrevistas (
    id SERIAL PRIMARY KEY,
    entrevistado INT,
    entrevistador INT,
    tempo_de_duracao DECIMAL(4, 2),
    CONSTRAINT fk_entrevistado FOREIGN KEY (entrevistado) REFERENCES entrevistados(entrevistado_id),
    CONSTRAINT fk_entrevistador FOREIGN KEY (entrevistador) REFERENCES membros(membro_id)
);

CREATE TABLE estagios (
    id_estagio SERIAL PRIMARY KEY,
    cargo_estagio VARCHAR(100),
    empresa VARCHAR(100),
    salario_medio DECIMAL(6,2),
    requisitos_estagio VARCHAR(100),
    carga_horaria DECIMAL(4,3)
);

CREATE TABLE carreiras (
    id_carreira SERIAL PRIMARY KEY,
    cargo_carreira VARCHAR(100),
    estagio INT,
    requisitos_cargo VARCHAR(100),
    CONSTRAINT fk_estagio FOREIGN KEY (estagio) REFERENCES estagios(id_estagio)
);

CREATE TABLE simulados (
    ID_simulado SERIAL PRIMARY KEY,
    fase_ensino VARCHAR(50),
    numero_questoes INT
);




INSERT INTO dicas (titulo_dicas, descricao_dicas) VALUES
('Dica Número 01: Planeje sua Rotina', 'Ter um bom plano para o seu dia é essencial, seja para passar no vestibular ou melhorar suas habilidades profissionais. Organizar o tempo de forma que você consiga estudar sem abrir mão de outras tarefas é o primeiro passo. Divida seu tempo de maneira equilibrada, estabeleça metas realistas para o que você vai estudar e não esqueça de reservar um tempo para descanso e lazer. Assim, você garante produtividade sem estresse excessivo.'),
('Dica Número 02: Crie o Hábito de Estudar', 'Planejar é importante, mas o verdadeiro progresso vem com a prática diária. Criar o hábito de estudar regularmente, mesmo que por pouco tempo, ajuda a consolidar o que você aprende. Estabeleça um horário fixo, escolha um ambiente tranquilo e mantenha a consistência. No início, pode ser difícil, mas com o tempo, estudar vai se tornar parte natural da sua rotina. Só lembre-se de equilibrar os estudos com momentos de lazer para evitar o desgaste.'),
('Dica Número 03: Revise o Conteúdo Diariamente', 'Revisar é uma das melhores formas de fixar o conteúdo. Quando você revê o que aprendeu, seu cérebro assimila melhor as informações e identifica os pontos que precisam de mais atenção. Dedique ao menos 10 a 15 minutos do seu dia para revisar as matérias, seja relendo anotações, refazendo exercícios ou até explicando o que aprendeu para alguém. Isso vai tornar o processo de aprendizado mais sólido e contínuo.'),
('Dica Número 04: Faça Exercícios e Pratique', 'Estudar a teoria é só metade do caminho. Praticar o que você aprendeu é essencial para entender de verdade os conceitos. Resolva exercícios, participe de simulados e busque aplicar o que aprendeu em situações práticas, como projetos ou problemas do dia a dia. Isso não só ajuda a fixar o conteúdo, mas também te prepara para desafios futuros e para aplicar esse conhecimento em contextos reais.'),
('Dica Número 05: Mantenha-se Atualizado', 'O mundo está em constante mudança, e as áreas de estudo e mercado de trabalho evoluem junto. Por isso, além de estudar os conteúdos base, é importante estar sempre de olho nas novidades. Acompanhe notícias, leia artigos e participe de eventos ou cursos online que estejam alinhados com seus interesses. Isso vai te ajudar a estar sempre à frente e preparado para novas oportunidades.'),
('Dica Número 06: Encontre uma Rede de Apoio', 'Estudar sozinho pode ser desafiador, e é aí que uma boa rede de apoio entra. Trocar ideias com amigos, colegas ou professores pode te ajudar a entender melhor os conteúdos e a manter a motivação. Participar de grupos de estudo, por exemplo, é uma ótima forma de aprender com os outros e ainda ajudar quem está com dificuldade. Além disso, um mentor ou alguém com mais experiência pode oferecer insights valiosos para o seu crescimento.'),
('Dica Número 07: Cuide da sua Saúde Mental e Física', 'Nenhum esforço vale a pena se a sua saúde estiver comprometida. Equilibrar os estudos com uma boa alimentação, exercício físico e momentos de lazer é essencial para manter o corpo e a mente funcionando bem. Se sentir exausto ou desmotivado é normal de vez em quando, mas é importante reconhecer quando parar e descansar. Tirar um tempo para si mesmo vai te ajudar a voltar aos estudos com mais foco e energia.');


INSERT INTO autores (nome, contratante) VALUES
('Miguel Sarti', 'SESI-SENAI'),
('Marília Monitchele', 'Veja'),
('Laísa Dall´Agnol', 'Veja'),
('Wilson Ledo', 'CNN'),
('Lucas Pordeus León', 'CNN'),
('Mirella Cordeiro', 'CNN'),
('Ana Zimmerman', 'G1');

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
(5, 'Abismo entre o que falamos e escrevemos pode estar na raiz de muitos erros de portugues, diz linguista', 'https://www.bbc.com/portuguese/articles/crgg1kz9rn4o', 'A lingua que a gente fala aborda a lingua falada em conversas espontaneas. Linguistas defendem que na comunicacao falada nao existe certo ou errado.', '2024-06-13', 'https://lp-projeto.vercel.app/img/noticia-14.png'),
(1, 'Estudiosos discutem a lingua portuguesa na educacao, literatura e comunicacao', 'https://jornal.usp.br/universidade/eventos/estudiosos-discutem-a-lingua-portuguesa-na-educacao-literatura-e-comunicacao/', 'Evento de valorizacao da lingua esta recebendo trabalhos academicos ate 16 de agosto', '2019-07-30', 'https://lp-projeto.vercel.app/img/noticia-15.png');


INSERT INTO cargos_scrum (cargo, funcao) VALUES
('Product Owner', 'Responsável por maximizar o valor do produto, gerenciar o backlog do produto e definir prioridades garantindo que a equipe de desenvolvedores entenda claramente os itens do backlog.'),
('Scrum Master', 'Responsável por garantir que a equipe de desenvolvedores siga os princípios e práticas do Srum, removendo impedimentos, facilitando reuniões e promovendo melhorias.'),
('Developers', 'Responsáveis por criar e entregar incrementos de produto de alta qualidade, colaborando para planejar, desenvolver, testar e revisar o trabalho necessário para atingir objetivos do sprint.');

INSERT INTO membros (nome, cargo, email, github) VALUES
('Pedro de Oliveira', 1, 'pedro.o.santos7@aluno.senai.br', 'pedro-ols'),
('Vitor Argeri', 2, 'vitor.argeri@aluno.senai.br', 'VitorArgeri'),
('Miguel Sarti', 3, 'miguel.sarti@aluno.senai.br', 'miguelsarti'),
('Raphaelle Lacerda', 3, 'raphaelle.lacerda@aluno.senai.br', 'R4phaLacerda'),
('Sara Souza', 3, 'sara.e.souza9@aluno.senai.br', 's0uzx');


INSERT INTO entrevistados (nome, cargo_rede_sesi) VALUES
('Daniela Real','Professor de Português'),
('Ivonete Pereira', 'Professor de Português'),
('Ana Freire', 'Professor de Português');

INSERT INTO entrevistas (entrevistado, entrevistador, tempo_de_duracao) VALUES
(1, 1, 09.35),
(2, 1, 10.13),
(3, 1, 07.54);

INSERT INTO estagios (cargo_estagio, empresa, salario_medio, requisitos_estagio, carga_horaria) VALUES
('Direito', 'XRM Advocacia', 1838.00, 'Leitura, Boa Escrita e Inteligência Emocional', 3.700),
('Letras', 'Academia Brasileira de Letras', 1739.51, 'Comunicação, Análise Textual e Escrita', 3.320),
('Pedagogia', 'Pedagogia para Liberdade', 1706.71, 'Inglês Fluente, Educação, Conhecimento para Ensinar', 3.200),
('Redação', 'Estagiário de Redação de Conteúdo', 1033.00, 'Graduação, Inglês fluente, Interpretação', 3.700);


INSERT INTO carreiras (cargo_carreira, estagio, requisitos_cargo) VALUES
('Professor', 3, 'Formação na área'),
('Escritor', 2, 'Escrever e criar texto corretamente e criativa.'),
('Juiz', 1, 'Formação na área');


INSERT INTO simulados (fase_ensino, numero_questoes) VALUES
('Ensino Fundamental 1', 5),
('Ensino Fundamental 2', 5),
('Ensino Médio', 15);


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

