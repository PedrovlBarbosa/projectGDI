db.createCollection("catalogo");
db.catalogo.insertMany([
    {
        "name": "Vestido Floral",
        "descricao": "Vestido curto de alças finas com estampa floral em tons de rosa e verde. Possui decote em V e fechamento com zíper invisível na parte de trás.",
        "tamanho": ["P","M","G"],
        "estilo" : "casual",
        "cores_diponiveis": ["Azul","Branco"],
        "preco": 129.90,
        "categoria": {
            $ref: "categorias",
            $id: db.categorias.findOne({name: "vestidos"})._id
        },
        "genero": "feminino"
    },
    {
        "name": "Vestido Urban",
        "descricao": "Vestido despojado, ideal para o dia a dia.",
        "tamanho": ["M","G"],
        "estilo" : "Street",
        "cores_diponiveis": ["Azul","Branco", "Camuflado"],
        "preco": 229.90,
        "categoria": {
            $ref: "categorias",
            $id: db.categorias.findOne({name: "vestidos"})._id
        },
        "genero": "feminino"
    },
    {
        "name": "Vestido Longo",
        "descricao": "Vestido com costura de alto padrão, perfeito para ocasioes especiais.",
        "tamanho": ["P","M","G"],
        "estilo" : "Elegante",
        "cores_diponiveis": ["Azul","Preto", "Vermelho"],
        "preco": 329.90,
        "categoria": {
            $ref: "categorias",
            $id: db.categorias.findOne({name: "vestidos"})._id
        },
        "genero": "feminino"
    },
    {
        "name": "Camiseta Estampada",
        "descricao": "Camiseta unissex em algodão. Disponível em diversas estampas.",
        "tamanho": ["PP","P","M","G"],
        "estilo": "Casual",
        "cores_disponiveis": ["Branco", "Preto", "Cinza"],
        "preco": 89.90,
        "categoria": {
            $ref: "categorias",
            $id: db.categorias.findOne({name: "camisetas"})._id
        },
        "genero": "unissex"
    },
    {
        "name": "Camiseta Basica",
        "descricao": "Camiseta unissex em algodão. Sem estampas.",
        "tamanho": ["PP","P","M","G", "GG"],
        "estilo": "Casual",
        "cores_diponiveis": ["Azul", "Branco", "Preto", "Marrom"],
        "preco": 59.90,
        "categoria": {
            $ref: "categorias",
            $id: db.categorias.findOne({name: "camisetas"})._id
        },
        "genero": "unissex"
    },
    {
        "name": "Camiseta Gola Alta",
        "descricao": "Camiseta unissex em algodão. Sem estampas, Tecido de alta qualidade",
        "tamanho": ["P","M","G"],
        "estilo": "Elegante",
        "cores_diponiveis": ["Azul", "Branco", "Preto"],
        "preco": 149.90,
        "categoria": {
            $ref: "categorias",
            $id: db.categorias.findOne({name: "camisetas"})._id
        },
        "genero": "unissex"
    },
    {
        "name": "Calca Skinny",
        "descricao": "Calça jeans com modelagem skinny e lavagem clara. Possui cintura média e cinco bolsos.",
        "tamanho": ["34","36","38","40","42"],
        "estilo": "Street",
        "cores_disponiveis": ["Azul", "Preto"],
        "preco": 159.90,
        "categoria": {
            $ref: "categorias",
            $id: db.categorias.findOne({name: "calcas"})._id
        },
        "genero": "unissex"
    },
    {
        "name": "Calca rasgada",
        "descricao": "Calça jeans masculina rasgada. Possui cintura média e cinco bolsos.",
        "tamanho": ["34","36","38","40","42"],
        "estilo": "casual",
        "preco": 179.90,
        "cores_disponiveis": ["Azul claro", "Preto"],
        "categoria": {
            $ref: "categorias",
            $id: db.categorias.findOne({name: "calcas"})._id
        },
        "genero": "masculino"
    },
    {
        "name": "Calca de shopping",
        "descricao": "Calça jeans feminina com modelagem boca de sino. Possui cintura média e cinco bolsos.",
        "tamanho": ["34","36","38","40","42"],
        "estilo": "casual",
        "preco": 159.90,
        "cores_desponiveis": ["Azul claro"],
        "categoria": {
            $ref: "categorias",
            $id: db.categorias.findOne({name: "calcas"})._id
        },
        "genero": "feminino"
    },
    {
        "name": "Blusa de Croche",
        "descricao": "Blusa de crochê em linha com detalhes em flores e folhas. Possui mangas curtas e decote em V.",
        "tamanho": ["P","M","G"],
        "preco": 89.90,
        "estilo": "casual",
        "cores_diponiveis": ["Branco", "Preto"],
        "categoria": {
            $ref: "categorias",
            $id: db.categorias.findOne({name: "blusas"})._id
        },
        "genero": "feminino"
    },
    {
        "name": "Blusa regata",
        "descricao": "Blusa regata idal para o dia a dia.",
        "tamanho": ["P","M","G"],
        "preco": 99.90,
        "estilo": "casual",
        "cores_disponiveis": ["Azul", "Vermelho", "Branco"],
        "categoria": {
            $ref: "categorias",
            $id: db.categorias.findOne({name: "blusas"})._id
        },
        "genero": "unissex"
    }, {
        "name": "Blusa basica",
        "descricao": "Blusa de estampado com detalhes em flores e folhas.",
        "tamanho": ["P","M","G"],
        "preco": 109.90,
        "estilo": "casual",
        "cores_disponiveis": ["Branco", "Preto", "Azul"],
        "categoria": {
            $ref: "categorias",
            $id: db.categorias.findOne({name: "blusas"})._id
        },
        "genero": "unissex"
    },
    {
        "name": "Bermuda Cargo",
        "descricao": "Bermuda masculina com bolsos laterais e fechamento em botão. Feita em algodão com modelagem reta.",
        "tamanho": ["38","40","44"],
        "estilo": "Street",
        "preco": 119.90,
        "cores_disponiveis": ["Camuflado"],
        "categoria": {
            $ref: "categorias",
            $id: db.categorias.findOne({name: "bermudas"})._id
        },
        "genero": "masculino"
    },
    {
        "name": "Bermuda",
        "descricao": "Bermuda masculina com bolsos laterais e fechamento em botão.",
        "tamanho": ["38","40","42","44"],
        "preco": 139.90,
        "estilo": "casual",
        "cores_disponiveis": ["Azul", "Preto"],
        "categoria": {
            $ref: "categorias",
            $id: db.categorias.findOne({name: "bermudas"})._id
        },
        "genero": "masculino"
    },
    {
        "name": "Bermuda Praina",
        "descricao": "Bermuda masculina com elastico.",
        "tamanho": ["38","40","42"],
        "preco": 139.90,
        "estilo": "moda praia",
        "cores_disponiveis": ["Azul", "Preto", "Branco"],
        "categoria": {
            $ref: "categorias",
            $id: db.categorias.findOne({name: "bermudas"})._id
        },
        "genero": "unissex"
    },
    {
        "name": "Saia Plissada",
        "descricao": "Saia midi plissada em tecido leve e fluido. Disponível em diversas cores.",
        "tamanho": ["P","M","G"],
        "preco": 99.90,
        "cores_diponiveis": ["Branco", "Verde"],
        "categoria": {
            $ref: "categorias",
            $id: db.categorias.findOne({name: "saias"})._id
        },
        "genero" : "feminino"
    },
    {
        "name": "Saia Curta",
        "descricao": "Saia mini com tecido leve e fluido.",
        "tamanho": ["P","M","G","GG"],
        "estilo" : "casual",
        "preco": 149.90,
        "cores_disponiveis": ["Azul", "Branco"],
        "categoria": {
            $ref: "categorias",
            $id: db.categorias.findOne({name: "saias"})._id
        },
        "genero" : "feminino"
    },
    {
        "name": "Saia Florida",
        "descricao": "Saia mini com tecido leve e fluido. Com estampa florida",
        "tamanho": ["P","M","G","GG"],
        "estilo" : "casual",
        "preco": 129.90,
        "cores_disponiveis": ["Azul", "Branco", "Verde"],
        "categoria": {
            $ref: "categorias",
            $id: db.categorias.findOne({name: "saias"})._id
        },
        "genero" : "feminino"
    },
    {
        "name": "Camisa Social",
        "descricao": "Camisa social masculina em algodão com modelagem slim fit. Possui botões na frente e nos punhos.",
        "tamanho": ["P","M","G","GG"],
        "preco": 189.90,
        "cores_diponiveis": ["Branco", "Preto"],
        "estilo": "casual",
        "categoria": {
            $ref: "categorias",
            $id: db.categorias.findOne({name: "camisa"})._id
        },
        "genero" : "masculino"
    },
    {
        "name": "Camisa Botão",
        "descricao": "Camisa social masculina em algodão com botão.",
        "tamanho": ["M","G","GG"],
        "preco": 269.90,
        "cores_disponiveis" : ["Branco", "Vinho", "Azul"],
        "estilo": "casual",
        "categoria": {
            $ref: "categorias",
            $id: db.categorias.findOne({name: "camisa"})._id
        },
        "genero": "unissex"

    },
    {
        "name": "Camisa Botão manga longa",
        "descricao": "Camisa social masculina em algodão com botão. Manga longa",
        "tamanho": ["M","G","GG"],
        "preco": 339.90,
        "cores_disponiveis" : ["Branco", "Vinho", "Azul", "Preto", "Verde"],
        "estilo": "casual",
        "categoria": {
            $ref: "categorias",
            $id: db.categorias.findOne({name: "camisa"})._id
        },
        "genero": "unissex"

    },
    {
        "name": "Camiseta cropped",
        "descrição": "Camisa de algodão no estilo cropped",
        "tamando": ["P", "M", "G"],
        "estilo": "casual",
        "preco": 99.90,
        "cores_disponiveis": ["Branco", "Preto", "Vermelho"],
        "categoria": {
            $ref: "categorias",
            $id: db.categorias.findOne({name: "camisa"})._id
        },
        "genero" : "feminino"
    },
    {
        "name": "Camiseta longa",
        "descrição": "Camisa de algodão no estilo manga longa",
        "tamando": ["P", "M", "G"],
        "estilo": "Street",
        "preco": 109.90,
        "cores_disponiveis": ["Preto", "Verde", "Branco"],
        "categoria": {
            $ref: "categorias",
            $id: db.categorias.findOne({name: "camisa"})._id
        },
        "genero" : "feminino"
    },
    {
        "name": "Short tectel",
        "descrição": "Short em material leve e sintetico. Ideal para a praia",
        "tamanho": ["P","M","G","GG"],
        "estilo" : "moda praia",
        "preco": 105.90,
        "cores_diponiveis" : ["Branco", "Verde"],
        "categoria": {
            $ref: "categorias",
            $id: db.categorias.findOne({name: "shorts"})
        }, 
        "genero": "masculino"
    },
    {
        "name": "Short de lycra",
        "descrição": "Short em material leve e sintetico. Ideal para a treino",
        "tamanho": ["P","M","G","GG"],
        "estilo" : "fitness",
        "preco": 99.00,
        "cores_diponiveis" : ["Branco", "Verde"],
        "categoria": {
            $ref: "categorias",
            $id: db.categorias.findOne({name: "shorts"})
        }, 
        "genero": "feminino"
    },
    {
        "name": "Short de treino",
        "descrição": "Short em material leve e sintetico. Ideal para treino",
        "tamanho": ["M","G","GG"],
        "estilo" : "fitness",
        "preco": 109.00,
        "cores_diponiveis" : ["Preto", "Azul", "Branco", "Verde"],
        "categoria": {
            $ref: "categorias",
            $id: db.categorias.findOne({name: "shorts"})
        }, 
        "genero": "masculino"
    },
    {
        "name": "Cueca box",
        "descrição": "Cueca do modelo box em material de algodão",
        "tamanho": ["M","G","GG"],
        "preco": 45.00,
        "estilo": "underwear",
        "categoria": {
            $ref: "categorias",
            $id: db.categorias.findOne({name:"cuecas"})
        },
        "genero": "masculino"
    },
    {
        "name": "Sunga",
        "descrição": "Sunga em material de algodão. ideal para praia ou piscina",
        "tamanho": ["M","G","GG"],
        "preco": 79.00,
        "estilo" : "moda praia",
        "cores_disponiveis": ["Azul", "Amarelo", "Verde", "Preto"],
        "categoria": {
            $ref: "categorias",
            $id: db.categorias.findOne({name:"cuecas"})
        },
        "genero": "masculino"
    },
    {
        "name": "Sutia",
        "descrição": "Sutiã de material sintetico",
        "tamanho": ["P", "M", "G"],
        "estilo": "underwear",
        "cores_disponiveis" : ["Branco", "Preto", "Cinza"],
        "preco": 80.00,
        "categoria": {
            $ref: "categorias",
            $id: db.categorias.findOne({name:"lingerie"})
        },
        "genero" : "feminino"
        },  
    {
        "name": "Calcinha",
        "descrição": "Calcinha de material sintetico",
        "tamanho": ["P", "M", "G", "GG"],
        "estilo": "underwear",
        "cores_disponiveis" : ["Branco", "Preto", "Cinza", "Verde"],
        "preco": 60.00,
        "categoria": {
            $ref: "categorias",
            $id: db.categorias.findOne({name:"lingerie"})
        },
        "genero" : "feminino"
        },      
]);
