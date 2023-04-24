//[findOne] 
db.catalogo.findOne({
  "preco" : {
      $lte: 100.00
  }
})

//[all] [find] produtos que tem tamanho P e M
db.catalogo.find({
  "tamanho" : {
      $all: [
        "P",
        "M"
      ]
  }
})

//[Gte] Roupas acima do ano de 2020
db.categoria.find({
  "ano": {
    $gte: 2020
  }
})

//[aggregate] média de preços das roupas
db.catalogo.aggregate([{
  $group: {
      _id:null, 
      mediaDosPrecos: {
          $avg:"$preco"
      }
  } 
}])

//[Exists] [limit] produtos com quantidae diferente de 0
db.loja.find(
  { 
  "produtos.quantidade": 
  { 
    $exists: true, $ne: 0 
    }
}).limit(5)

// [Count] [group] [Pretty] Quantidade de tipos produtos em cada loja
db.loja.aggregate([
  {
      $unwind: {
          path: '$produtos'
      }
 }, 
 {
      $group: {
          _id: '$nome',
          produto: {
              $count: {}
          }
      }
  }
]).pretty();

//[Sum] [Sort] quantidade de produtos de cada loja
db.loja.aggregate([
  {
    $unwind: "$produtos"
  },
  {
    $group: {
      _id: "$nome",
      quantidadeTotal: { $sum: "$produtos.quantidade" }
    }
  },
  {
    $sort: {
      quantidadeTotal: -1
    }
  }
])

//[Match] [Project] campos da categoria vestidos
db.catalogo.aggregate([
  {
    $match: {
      "categoria.$id": db.categorias.findOne(
        {
          name: "vestidos"
        })._id
    }
  },
  {
    $project: {
      _id: 0,
      name: 1,
      descricao: 1,
      preco: 1
    }
  }
])

//[Lookup] categoria de cada produto do catalogo
db.catalogo.aggregate([
  {
    $lookup: {
      from: "categorias",
      localField: "categoria.$id",
      foreignField: "_id",
      as: "categoria"
    }
  }
]);

//[max] produto mais caro de cada categoria
db.catalogo.aggregate([
  {
    $group: {
      _id: "$categoria.$id",
      produto: { $max: { preco: "$preco", name: "$name" } }
    }
  },
  {
    $lookup: {
      from: "categorias",
      localField: "_id",
      foreignField: "_id",
      as: "categoria"
    }
  },
  {
    $unwind: "$categoria"
  },
  {
    $project: {
      _id: 0,
      categoria: "$categoria.name",
      produto: "$produto.name",
      preco: "$produto.preco"
    }
  }
])

//[size] produtos com pelo menos 3 tamanhos diferentes diponíveis
db.catalogo.find(
  { "tamanho": 
  { 
    $size: 3 
  } 
})