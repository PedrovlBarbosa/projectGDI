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

//[Exists] produtos com quantidae diferente de 0
db.loja.find(
  { 
  "produtos.quantidade": 
  { 
    $exists: true, $ne: 0 
    } 
})

// [Count] [group] Quantidade de produtos em cada loja
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
]);

//[Sum] [Sort]
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