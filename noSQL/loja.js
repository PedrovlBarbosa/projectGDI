db.createCollection("loja");
db.loja.insertOne({
    "nome": "Loja 1",
    "endereco": "Rua das Flores, 123 - Centro, São Paulo - SP",
    "produtos": [
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Vestido Floral"})._id
            },
            "quantidade": 50
        },
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Camiseta Basica"})._id
            },
            "quantidade": 30
        },
    ]
});

db.loja.insertOne({
    "nome": "Loja 2",
    "endereco": "Avenida Fashion, 456 - Paulista, Paulista - PE",
    "produtos": [
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Calsa Jeans Skinny"})._id
            },
            "quantidade": 20
        },
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Blusa de Croche"})._id
            },
            "quantidade": 40
        },
    ]
});

db.loja.insertOne({
    "nome": "Loja 3",
    "endereco": "Avenida da Aventura, 456 - Vila Aventureira, Rio de Janeiro - RJ",
    "produtos": [
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Bermuda Cargo"})._id
            },
            "quantidade": 25
        },
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Saia Plissada"})._id
            },
            "quantidade": 35
        },
    ]
});

db.loja.insertOne({
    "nome": "Loja 4",
    "endereco": "Avenida General Manoel Rabelo, 1111 - Cavaleiro, Jabotão dos Guararapes - PE",
    "produtos": [
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Camisa Social"})._id
            },
            "quantidade": 15
        },
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Saia Plissada"})._id
            },
            "quantidade": 35
        },
    ]
});

db.loja.insertOne({
    "nome" : "Loja 5",
    "endereco": "Rua das artes, 302 - Boa Vista, Recife - PE",
    "produtos": [
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Cueca box"})._id   
            },
            "quantidade" : 20
        },
        {
            "produto": {
                $ref:"catalogo",
                $id: db.catalogo.findOne({name: "Sutiã"})._id
            },
            "quantidade": 19
        }
    ]
});

db.loja.insertOne({
    "nome" : "Loja 6",
    "endereco": "Rua das cirandas, 40 - Derby, Recife - PE",
    "produtos": [
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Short tectel"})._id   
            },
            "quantidade" : 16
        },
        {
            "produto": {
                $ref:"catalogo",
                $id: db.catalogo.findOne({name: "Camiseta Basica"})._id
            },
            "quantidade": 19
        }
    ]
});
