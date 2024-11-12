Esquematização MER - Projeto Final de Banco de Dados

    Entidades:
        Notícias;
        Autores;
        Estágios;
        Carreiras;
        Dicas;
        Membros;
        Cargos Scrum;

    Atributos:
        Autores
            - id;
            - nome;
            - contratante;
            - notícias;

        Cargos Scrum
            - id; 
            - nome;
            - função;

        Carreiras
            - id;
            - cargo;
            - salário médio;
            - requisitos;
            - carga horária;

        Entrevistas
            - id;
            - entrevistado;
            - tempo de duração;
        
        Entrevistados
            - id;
            - nome;
            - cargo na rede sesi;
        
        Estágios
            - id;
            - cargo;
            - empresa;
            - salário médio;
            - requisitos;
            - carga horária;
        
        Dicas
            - id;
            - título;
            - descrição;

        Notícias
            - id;
            - autores;
            - título;
            - fonte;
            - lead;
            - data de publicação;
               
        Membros
            - id;
            - nome;
            - cargo;
            - email;
            - github;

    Relacionamentos:
        - Cada autor possui no mínimo nenhuma e no máximo várias notícias, enquanto cada notícia é possuída por pelo menos um autor, e no máximo vários;
        - Cada membro possui exatamente 1 cargo scrum, enquanto cada cargo possui pelo menos um, e no máximo varios membros;
        - Cada entrevista possui exatamente um entrevistado, enquanto um entrevistado é possuído por no mínimo nenhuma notícia, e no máximo várias;