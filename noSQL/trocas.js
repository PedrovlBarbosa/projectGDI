// [RenameCollection] Renomeia as coleções

db.catalogo.renameCollection("Catalog");
db.categorias.renameCollection("Categories");
db.lojas.renameCollection("Store");

// [Save] Modificar o nome da Loja Riachuelo para Riachuelo e usar o .SAVE
let loja = db.lojas.findOne({ nome: "Loja Riachuelo" });

// atualiza o nome da loja
loja.nome = "Riachuelo";

// salva as mudanças na coleção
db.lojas.save(loja);

