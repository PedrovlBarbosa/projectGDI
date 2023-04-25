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

//[gte] Roupas acima do ano de 2020
db.categorias.find({
  $and: [
      {fabricado: "Brasil"},
      {ano: {$gte: 2021}}
  ]
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


// WHERE e Function lista as categorias que tiveram roupas fabricadas na china
db.categoria.find({$where: function() {
    return (this.fabricado == "China")}
}).pretty();


// MAPREDUCE; Duas funçoes <map , reduce> para listar as lojas e seus endereços e verificar a quantidade de produtos
var mapFunction_ = function() {
    var quant = this.produtos(1).quantidade;
    emit (this.name, this.endereco, quant);
};

var reduceFunction_ = function(name, endereco, quant) {
    return Array.sum(quant);
};

db.loja.mapReduce (
  mapFunction_,
  reduceFunction_,
  {out: "loja_mapReduce"}
);


// ADDTOSET para adicionar novo catalogo a loja 1
db.loja.updateMany({nome: "Loja 1"}, {$addToSet:
    {
      produtos:
      {
        $each: 
        [
          db.catalogo.findOne({name: "Cueca box"})._id,
          db.catalogo.findOne({name: "Short tectel"})._id
        ]
      }
    }
});