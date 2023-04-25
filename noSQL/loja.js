db.createCollection("lojas");
db.lojas.insertOne({
    "nome": "Loja Riachuelo",
    "endereco": {
        "rua": "rua das flores",
        "bairro": "Boa vista",
        "cidade": "Recife",
        "estado": "Pernambuco"
    }, 
    "produtos_disponiveis": [
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Vestido Floral"})._id
            },
            "quantidade": 26
        },
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Camiseta Estampada"})._id
            },
            "quantidade": 14
        },
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Camiseta Gola Alta"})._id
            },
            "quantidade": 18
        },
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Calca Skinny"})._id
            },
            "quantidade": 6
        },
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Calca rasgada"})._id
            },
            "quantidade": 12
        },
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Blusa regata"})._id
            },
            "quantidade": 26
        },
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Bermuda Cargo"})._id
            },
            "quantidade": 14
        },
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Bermuda Praina"})._id
            },
            "quantidade": 18
        },
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Saia Curta"})._id
            },
            "quantidade": 5
        },
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
                $id: db.catalogo.findOne({name:  "Camisa Botão manga longa"})._id
            },
            "quantidade": 17
        },
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Camiseta longa"})._id
            },
            "quantidade": 09
        },
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name:  "Short de lycra"})._id
            },
            "quantidade": 06
        },
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Cueca box"})._id
            },
            "quantidade": 07
        },
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Calcinha"})._id
            },
            "quantidade": 24 
        },
        
    ],
    "produtos_vendidos":[
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Calca rasgada"})._id
            },
            "quantidade_vendida": 1,
            "data_venda" : new Date("03/12/23")
        },
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Camiseta Gola Alta"})._id
            },
            "quantidade_vendida": 2,
            "data_venda" : new Date("06/12/23")
        },
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Camiseta Estampada"})._id
            },
            "quantidade_vendida": 4,
            "data_venda" : new Date("22/12/23")
        },
    ],
});

db.loja.insertOne({
    "nome": "Loja Renner",
    "endereco": 
        {
            "rua": "Avenida Fashion",
            "bairro": "Boa Vista",
            "cidade" : "Recife",
            "estado": "Pernambuco"
        },
    "produtos_disponiveis": [
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Vestido Urban"})._id
            },
            "quantidade": 26
        },
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Vestido Longo"})._id
            },
            "quantidade": 14
        },
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Camiseta Basica"})._id
            },
            "quantidade": 18
        },
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Calca de shopping"})._id
            },
            "quantidade": 6
        },
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name:  "Blusa de Croche"})._id
            },
            "quantidade": 4
        },
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Blusa basica"})._id
            },
            "quantidade": 10
        },
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Bermuda"})._id
            },
            "quantidade": 11
        },
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Saia Plissada"})._id
            },
            "quantidade": 5
        },
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Saia Florida"})._id
            },
            "quantidade": 15
        },
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Camisa Botão"})._id
            },
            "quantidade": 11
        },
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Camiseta cropped"})._id
            },
            "quantidade": 12
        },
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Short tectel"})._id
            },
            "quantidade": 08
        },
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name:  "Short de treino"})._id
            },
            "quantidade": 06
        },
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Sunga"})._id
            },
            "quantidade": 12
        },
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Sutia"})._id
            },
            "quantidade": 09
        },
    ],
    "produtos_vendidos":[
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Camiseta cropped"})._id
            },
            "quantidade_vendida": 5,
            "data_venda" : new Date("03/12/23")
        },
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Saia Florida"})._id
            },
            "quantidade_vendida": 5,
            "data_venda" : new Date("06/12/23")
        },
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Camisa Botão"})._id
            },
            "quantidade_vendida": 4,
            "data_venda" : new Date("22/12/23")
        },
        {
            "produto": {
                $ref: "catalogo",
                $id: db.catalogo.findOne({name: "Vestido Urban"})._id
            },
            "quantidade_vendida": 4,
            "data_venda" : new Date("22/12/23")
        },
    ],
});

