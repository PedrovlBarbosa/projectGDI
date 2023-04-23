db.createCollection("categorias");
db.categorias.insertMany([
    {
        "name": "vestidos",
        "fabricado": "brasil",
        "marca": "Floratta Modas",
        "ano": "2022",
        "genero": "feminino"
    },
    {
        "name": "blusas",
        "fabricado": "brasil",
        "marca": "Arte em Crochê",
        "ano": "2021",
        "genero": "feminino"
    },
    {
        "name": "saias",
        "fabricado": "argentina",
        "marca": "Moda Feminina",
        "ano": "2021",
        "genero": "feminino"
    },
    {
        "name": "camisetas",
        "fabricado": "china",
        "marca": "Basic Wear",
        "ano": "2021",
        "genero": "masculino"
    },
    {
        "name": "calcas",
        "fabricado": "india",
        "marca": "Denim Company",
        "ano": "2020",
        "genero": "masculino"
    },
    {
        "name": "bermudas",
        "fabricado": "bangladesh",
        "marca": "Outdoor Adventures",
        "ano": "2022",
        "genero": "masculino"
    },
    {
        "name": "camisa",
        "fabricado": "brasil",
        "marca": "Hering",
        "ano": "2023",
        "genero": "masculino"
    }
]);