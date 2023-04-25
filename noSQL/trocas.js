// [RenameCollection] Renomeia as coleções

db.catalogo.renameCollection("Catalog");
db.categorias.renameCollection("Categories");
db.loja.renameCollection("Store");

// [Save] Adiciona mais uma categoria
db.Categories.save({
    "name": "moletom",
    "fabricado": "Estados Unidos",
    "marca": "MoletOns",
    "ano": "2023",
    "genero": "masculino"
});

// [AddToSet] Adiciona um novo tamanho ao catalogo
db.Categories.updateOne({
    "name": "Cueca box"
}, {
    $push: {
        tamanho: "P",
        },
});
