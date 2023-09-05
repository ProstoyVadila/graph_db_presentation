create 
    (Cypher:Language {
        name: "Cypher",
        type: "Declarative",
        year: 2012,
        description: "Декларативный язык запросов для графов свойств,созданный для графовой базы данных Neo4j.",
        example: "MATCH\n(person) -[:BORN_IN]->  () -[:WITHIN*0..]-> (us:Location {name:'United States'}),\n(person) -[:LIVES_IN]-> () -[:WITHIN*0..]-> (eu:Location {name:'Europe'})\nRETURN person.name"
    }),
    (Neo4j:Database {
        name: 'Neo4j',
        description: 'Графовая база данных, которая хранит данные в виде узлов и отношений, а не в виде строк и столбцов.',
        year: 2007,
        type: 'Graph'
    }),
    (Datalog:Language {
        name: 'Datalog',
        description: 'Декларативный язык запросов, основанный на логике предикатов первого порядка.',
        year: 1977,
        type: 'Declarative',
        example: "name(namerica, 'North America').\ntype(namerica, continent).\nname(usa, 'United States').\ntype(usa, country).\nwithin(usa, namerica).\nname(idaho, 'Idaho').\ntype(idaho, state).\nwithin(idaho, usa).\nname(lucy, 'Lucy').\nborn_in(lucy, idaho).\n\nwithin_recursive(Location, Name) :- name(Location, Name).   /* Правило 1 */\nwithin_recursive(Location, Name) :- within(Location, Via),  /* Правило 2 */\nwithin_recursive(Via, Name).\nmigrated(Name, BornIn, LivingIn) :- name(Person, Name),     /* Правило 3 */\nborn_in(Person, BornLoc),\nwithin_recursive(BornLoc, BornIn),\nlives_in(Person, LivingLoc),\nwithin_recursive(LivingLoc, LivingIn).\n?- migrated(Who, 'United States', 'Europe'). /* Who = 'Lucy'. */"
    }),
    (Datomic:Database {
        name: 'Datomic',
        description: 'Распределенная база данных, которая хранит данные в виде узлов и отношений, а не в виде строк и столбцов.',
        year: 2012,
        type: 'Graph'
    }),
    (SPARQL:Language {
        name: 'SPARQL',
        description: 'Язык запросов, который использует синтаксис, похожий на SQL, для запросов к графовой базе данных.',
        year: 2012,
        type: 'Declarative',
        example: 'PREFIX : <urn:example:>\nSELECT ?personName WHERE {\n?person :name ?personName.\n?person :bornIn  / :within* / :name "United States".\n?person :livesIn / :within* / :name "Europe".\n}'
    }),
    (RDF:Language {
        name: 'RDF',
        description: 'Resource Description Framework - ыл задуман как механизм публикации данных различными сайтами в едином формате, благодаря чему данные с различных сайтов могли бы автоматически объединяться в паутину данных — своеобразную «всеоб- щую базу данных» Интернета.',
        year: 1999,
        type: 'Graph'
    }),
    (Turtle:Language {
        name: 'Turtle',
        description: 'Язык для описания данных в виде узлов и отношений, а не в виде строк и столбцов.',
        year: 2008,
        type: 'Graph',
        example: '\n@prefix : <urn:example:>.\n_:lucy     a       :Person.\n_:lucy     :name   "Lucy".\n_:lucy     :bornIn _:idaho.\n_:idaho    a       :Location.\n_:idaho    :name   "Idaho".\n_:idaho    :type   "state".\n_:idaho\n_:usa\n_:usa\n_:usa      :type   "country".\n_:usa      :within _:namerica.\n_:namerica a\n_:namerica :name\n_:namerica :type\n:Location.\n"North America".\n"continent".\n:within _:usa.\na       :Location.\n:name   "United States" '
    }),
    (Titan:Database {
        name: 'Titan',
        year: 2012,
        type: 'Graph'
    }),
    (InfiniteGraph:Database {
        name: 'InfiniteGraph',
        year: 2008,
        type: 'Graph'
    }),
    (AllegroGraph:Database {
        name: 'AllegroGraph',
        year: 2004,
        type: 'Graph'
    }),
    (Memgraph:Database {
        name: 'Memgraph',
        year: 2016,
        type: 'Graph'
    }),
    (GraphLanguages:Label {
        name: 'Языки запросов графовых баз данных из подмножества Нотации 3 (Notation3, N3)'
        
    }),
    (PopularGraphDB:Label {
        name: 'Популярные графовые базы данных'
        
    }),
    (GraphModelTypes:Label {
        name: 'Типы графовых моделей'
        
    }),
    (PropertyGraph:Label {
        name: 'Графовая модель свойств',
        description: "В модели графов свойств каждая вершина состоит из:\n- уникального идентификатора;\n- множества исходящих ребер;\n- множества входящих ребер;\n- коллекции свойств (пар «ключ — значение»)\n\nКаждое ребро состоит из:\n- уникального идентификатора;\n- вершины, с которой оно начинается (начальная вершина);\n- вершины, которой оно заканчивается (конечная вершина);\n- коллекции свойств (пар «ключ — значение»).\n\nВажные аспекты этой модели: \n\t1. Любая вершина может быть соединена ребром с любой другой вершиной. Схема не накладывает ограничения на то, какие элементы могут быть связаны.\n\t2. Для любой вершины можно найти как ее входящие, так и исходящие ребра и таким образом выполнить обход графа: найти путь по цепочке вершин — как в прямом, так и обратном направлении\n\t3. Задействуя различные метки для разных видов связей, можно хранить в одном графе несколько разных видов информации, сохраняя при этом чистоту модели."
    }),
    (TripleTupleStorage:Label {
        name: 'Хранение тройных кортежей',
        description: 'В модели хранения тройных кортежей каждый элемент данных представляется в виде тройного кортежа: Модель тройных кортежей практически эквивалентна модели графов свойств и использует разные слова для описания одних и те же идей. Тем не менее имеет смысл ее обсудить, поскольку для хранилищ тройных кортежей существуют различные утилиты и языки, которые могут быть полезны при создании приложений. В хранилище тройных кортежей вся информация хранится в форме очень простых трехкомпонентных высказываний: (субъект, предикат, объект). Например, в тройном кортеже (Джим, любит, бананы). Джим — субъект (подлежащее), любит — предикат (сказуемое), а бананы — объект (дополнение).'
    }),
    (WhatIsGraph:Label {
        name: 'Что такое граф?',
        description: 'Граф — это структура данных, состоящая из узлов и ребер. Узлы представляют собой сущности, а ребра — отношения между сущностями. Графы используются для представления и обработки связей между объектами. Узлы (связи) могут быть направленными, тогда граф считается ориентированным (орграф).'
    }),
    (GraphModels:Label {
        name: 'Графоподобные модели данных'
    }),
    (HowGraphDBWorks:Label {
        name: 'Как работает графовая база данных?',
        description: 'Графовое хранилище можно представить как состоящее из двух реляционных таблиц, одна для вершин, вторая — для ребер. Для каждого ребра хранится информация о начальной и конечной вершине, так что при необходимости получить множество входящих или исходящих ребер для данной вершины можно запросить поля head_vertex и tail_vertex соответственно из таблицы edges.'
    }),
    (GraphModels)-[:CONTAINS]->(WhatIsGraph),
    (GraphModels)-[:CONTAINS]->(HowGraphDBWorks),
    (GraphModels)-[:CONTAINS]->(GraphModelTypes),
    (PopularGraphDB)-[:CONTAINS]->(Neo4j),
    (PopularGraphDB)-[:CONTAINS]->(Datomic),
    (PopularGraphDB)-[:CONTAINS]->(Titan),
    (PopularGraphDB)-[:CONTAINS]->(InfiniteGraph),
    (PopularGraphDB)-[:CONTAINS]->(AllegroGraph),
    (PopularGraphDB)-[:CONTAINS]->(Memgraph),
    (GraphModelTypes)-[:CONTAINS]->(PropertyGraph),
    (GraphModelTypes)-[:CONTAINS]->(TripleTupleStorage),
    (PropertyGraph)-[:CONTAINS]->(Neo4j),
    (PropertyGraph)-[:CONTAINS]->(Titan),
    (PropertyGraph)-[:CONTAINS]->(InfiniteGraph),
    (TripleTupleStorage)-[:CONTAINS]->(Datomic),
    (TripleTupleStorage)-[:CONTAINS]->(AllegroGraph),
    (Neo4j)-[:SUPPORTS]->(Cypher),
    (Datomic)-[:SUPPORTS]->(Datalog),
    (GraphLanguages)-[:CONTAINS]->(Cypher),
    (GraphLanguages)-[:CONTAINS]->(Datalog),
    (GraphLanguages)-[:CONTAINS]->(SPARQL),
    (GraphLanguages)-[:CONTAINS]->(RDF),
    (GraphLanguages)-[:CONTAINS]->(Turtle);