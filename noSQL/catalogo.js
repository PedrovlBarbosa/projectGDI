db.createCollection("catalogo");
db.catalogo.insertMany([
    {
        "name": "Vestido Floral",
        "descricao": "Vestido curto de alças finas com estampa floral em tons de rosa e verde. Possui decote em V e fechamento com zíper invisível na parte de trás.",
        "tamanho": ["P","M","G"],
        "preco": 129.90,
        "categoria": {
            $ref: "categorias",
            $id: db.categorias.findOne({name: "vestidos"})._id
        }
    },
    {
        "name": "Camiseta Basica",
        "descricao": "Camiseta unissex em algodão com modelagem reta e gola redonda. Disponível em diversas cores.",
        "tamanho": ["PP","P","M","G","GG"],
        "preco": 49.90,
        "categoria": {
            $ref: "categorias",
            $id: db.categorias.findOne({name: "camisetas"})._id
        }
    },
    {
        "name": "Calsa Jeans Skinny",
        "descricao": "Calça jeans feminina com modelagem skinny e lavagem clara. Possui cintura média e cinco bolsos.",
        "tamanho": ["34","36","38","40","42"],
        "preco": 159.90,
        "categoria": {
            $ref: "categorias",
            $id: db.categorias.findOne({name: "calcas"})._id
        }
    },
    {
        "name": "Blusa de Croche",
        "descricao": "Blusa de crochê em linha com detalhes em flores e folhas. Possui mangas curtas e decote em V.",
        "tamanho": ["P","M","G"],
        "preco": 89.90,
        "categoria": {
            $ref: "categorias",
            $id: db.categorias.findOne({name: "blusas"})._id
        }
    },
    {
        "name": "Bermuda Cargo",
        "descricao": "Bermuda masculina com bolsos laterais e fechamento em botão. Feita em algodão com modelagem reta.",
        "tamanho": ["38","40","42","44"],
        "preco": 119.90,
        "categoria": {
            $ref: "categorias",
            $id: db.categorias.findOne({name: "bermudas"})._id
        }
    },
    {
        "name": "Saia Plissada",
        "descricao": "Saia midi plissada em tecido leve e fluido. Disponível em diversas cores.",
        "tamanho": ["P","M","G"],
        "preco": 99.90,
        "categoria": {
            $ref: "categorias",
            $id: db.categorias.findOne({name: "saias"})._id
        }
    },
    {
        "name": "Camisa Social",
        "descricao": "Camisa social masculina em algodão com modelagem slim fit. Possui botões na frente e nos punhos.",
        "tamanho": ["P","M","G","GG"],
        "preco": 189.90,
        "categoria": {
            $ref: "categorias",
            $id: db.categorias.findOne({name: "camisa"})._id
        }
    },
    {
        "name": "Camiseta cropped",
        "descrição": "Camisa de algodão no estilo cropped",
        "tamando": ["P", "M"],
        "preco": 89.90,
        "categoria": {
            $ref: "categorias",
            $id: db.categorias.findOne({name: "camisa"})._id
        }
    },
    {
        "name": "Short tectel",
        "descrição": "Short em material leve e sintetico. Ideal para a praia",
        "tamanho": ["P","M","G"],
        "preco": 99.00,
        "categoria": {
            $ref: "categorias",
            $id: db.categorias.findOne({name: "shorts"})
        }
    },
    {
        "name": "Cueca box",
        "descrição": "Cueca do modelo box em material de algodão",
        "tamanho": ["M","G","GG"],
        "preco": 45.00,
        "categoria": {
            $ref: "categorias",
            $id: db.categorias.findOne({name:"cuecas"})
        }
    },
    {
        "name": "Sutiã",
        "descrição": "Sutiã de material sintetico",
        "tamanho": ["P", "M", "G"],
        "preco": 60.00,
        "categoria": {
            $ref: "categorias",
            $id: db.categorias.findOne({name:"lingerie"})
        }
    }    
]);
