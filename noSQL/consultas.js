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


// WHERE e Function lista o catalogo que as roupas sao unissex
db.catalogo.find({
    $where: function() {
      return this.genero == 'unissex';
    }
  })

// MAPREDUCE;
// Função de mapeamento
var mapFunction = function() {
    for (var i = 0; i < this.produtos_vendidos.length; i++) {
        var key = this.produtos_vendidos[i].produto.$id;
        var value = this.produtos_vendidos[i].quantidade_vendida;
        emit(key, value);
    }
};

// Função de redução
var reduceFunction = function(key, values) {
    return Array.sum(values);
};

// Executa o operador MAPREDUCE
db.lojas.mapReduce(
    mapFunction,
    reduceFunction,
    {
        out: "total_vendas_por_produto"
    }
);

// Resultado
db.total_vendas_por_produto.find();


// ADDTOSET para adicionar novo catalogo a Loja Riachuelo
db.lojas.updateOne(
    { "nome": "Loja Riachuelo" },
    { $addToSet: { "produtos_disponiveis": 
        { "produto": { 
            $ref: "catalogo", 
            $id: db.catalogo.findOne({name: "Camiseta cropped"})._id 
          },
          "quantidade": 10
        } 
      } 
    }
);
