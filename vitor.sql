CREATE TABLE noticias (
    id SERIAL PRIMARY KEY,
    autor VARCHAR(200),
    titulo VARCHAR(500) NOT NULL,
    fonte VARCHAR(500) UNIQUE NOT NULL,
    lead VARCHAR(500) NOT NULL,
    data_publicacao DATE,
    imagem VARCHAR(500),
    CONSTRAINT fk_autor FOREIGN KEY (autor) REFERENCES autores(ID_autor)
);

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